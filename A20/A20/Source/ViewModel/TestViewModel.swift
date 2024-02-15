//
//  TestViewModel.swift
//  A20
//
//  Created by 드즈 on 2/13/24.
//

//import SwiftUI
//
//fileprivate let url/*String*/: String = ""
//
////@MainActor // or Task (Main Thread)
//class TestViewModel: ObservableObject {
////    @Published var model: Model
//    
//    private var urlString = ""
//    
//    func fetchData() async throws -> () {
//        // URL
//        guard let url = URL(string: urlString) else {
//            throw DataFetchError.invalidURL
//        }
//        
//        // Request
//        var modelRequest = URLRequest(url: url)
//        modelRequest.httpMethod = "GET"
//        modelRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        modelRequest.addValue("Bearer \(self.accessToken)", forHTTPHeaderField: "Authorization")
//        
//        // Session
//        let (data, _) = try await URLSession.shared.data(for: infoRequest)
//        
//        // Decoding
////        print("DEBUG: \(String(data: data, encoding: .utf8))")
//        let decodedData = try JSONDecoder().decode(Model.self, from: data)
//
//        // Task (Main Thread)
//        DispatchQueue.main.async {
//            self.model = decodedData
//        }
//        
//        return
//    }
//}
