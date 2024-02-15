//
//  CommunityViewModel.swift
//  A20
//
//  Created by 드즈 on 2/14/24.
//

import SwiftUI

fileprivate let writeURLString: String = "https://test.hackathon.sparcs.net/posts/create"

//@MainActor // or Task (Main Thread)
class CommunityViewModel: ObservableObject {
    @Published var post: Posts
//    @Published var clickPost: ClickPost
    @Published var writePost: WritePost
    
    @Published var communityDistrict: String = "" // 구
    @Published var communityTag: String = "Report" // Report / FeedBack
    @Published var postId: String = ""
    
    @Published var id: String = ""
    @Published var token: String = ""
    
    @Published var title: String = ""
    @Published var content: String = ""
    @Published var nine: String = ""
    @Published var dong: String = ""
    @Published var imageUrl: String?
    @Published var tag: String = ""
    @Published var email: String = ""
    
    init(postDataString: Posts/*, clickDataString: ClickPost*/, writeDataString: WritePost) {
        self.post = postDataString
//        self.clickPost = clickDataString
        self.writePost = writeDataString
    }
    
    var districtURLString: String = "https://test.hackathon.sparcs.net/posts/:district"
    var tagURLString = "https://test.hackathon.sparcs.net/posts/:tag"
//    var clickURLString = "https://test.hackathon.sparcs.net/posts/:postId"
    
    func districtPost() async throws -> Void {
        districtURLString = "https://test.hackathon.sparcs.net/posts/:\(self.communityDistrict)"
        
        // URL
        guard let districtURL = URL(string: districtURLString) else {
            throw DataFetchError.invalidURL
        }
        
        // Request
        var districtRequest = URLRequest(url: districtURL)
        districtRequest.httpMethod = "GET"
        districtRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Session
        let (data, _) = try await URLSession.shared.data(for: districtRequest)
        
        // Decoding
//        print("DEBUG: \(String(data: data, encoding: .utf8))")
        let decodedData = try JSONDecoder().decode(Posts.self, from: data)
        
        // Task (Main Thread)
        DispatchQueue.main.async {
            self.post = decodedData
        }
        
        return
    }
    
    func tagPost() async throws -> Void {
        tagURLString = "https://test.hackathon.sparcs.net/posts/:\(self.communityTag)"
        
        // URL
        guard let tagURL = URL(string: tagURLString) else {
            throw DataFetchError.invalidURL
        }
        
        // Request
        var tagRequest = URLRequest(url: tagURL)
        tagRequest.httpMethod = "POST"
        tagRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Session
        let (data, _) = try await URLSession.shared.data(for: tagRequest)
        
        // Struct로 디코딩
//        print("DEBUG: \(String(data: data, encoding: .utf8)/*!*/)")
        let decodedContextData = try JSONDecoder().decode(Posts.self, from: data)
        
        // Task (Main Thread)
        DispatchQueue.main.async {
            self.post = decodedContextData
        }
        
        return
    }
    
//    func clickPost() async throws -> Void {
//        clickURLString = "https://test.hackathon.sparcs.net/posts/:\(self.postId)"
//        
//        // URL
//        guard let clickURL = URL(string: clickURLString) else {
//            throw DataFetchError.invalidURL
//        }
//        
//        // Request
//        var clickRequest = URLRequest(url: clickURL)
//        clickRequest.httpMethod = "POST"
//        clickRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        // Session
//        let (data, _) = try await URLSession.shared.data(for: clickRequest)
//        
//        // Struct로 디코딩
////        print("DEBUG: \(String(data: data, encoding: .utf8)/*!*/)")
//        let decodedContextData = try JSONDecoder().decode(ClickPost.self, from: data)
//        
//        // Task (Main Thread)
//        DispatchQueue.main.async {
//            self.clickPost = decodedContextData
//        }
//        
//        return
//    }
    
    func writePost() async throws -> Void {
        // URL
        guard let writeURL = URL(string: writeURLString) else {
            throw DataFetchError.invalidURL
        }
        
        // Request
        var writeRequest = URLRequest(url: writeURL)
        writeRequest.httpMethod = "POST"
        writeRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        writeRequest.addValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
        
        // Body
        let RequestBody = ["title": self.title, "content": self.content, "district": self.nine, "area": self.dong, "imageUrl": self.imageUrl, "tag": self.tag, "email": self.email] // MARK: nil?
        writeRequest.httpBody = try? JSONSerialization.data(withJSONObject: RequestBody, options: [])
        
        // Session
        let (data, _) = try await URLSession.shared.data(for: writeRequest)
        
        // Struct로 디코딩
//        print("DEBUG: \(String(data: data, encoding: .utf8)/*!*/)")
        let decodedContextData = try JSONDecoder().decode(WritePost.self, from: data)
        
        // Task (Main Thread)
        DispatchQueue.main.async {
            self.writePost = decodedContextData
        }
        
        return
    }
}
