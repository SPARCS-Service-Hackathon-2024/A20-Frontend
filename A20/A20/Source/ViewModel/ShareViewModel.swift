//
//  ShareViewModel.swift
//  A20
//
//  Created by 현채정 on 2/15/24.
//

import SwiftUI

fileprivate let registURLString: String = "https://test.hackathon.sparcs.net/share/lend"
fileprivate let sendURLString: String = "https://test.hackathon.sparcs.net/share/borrow"

//@MainActor // or Task (Main Thread)
class ShareViewModel: ObservableObject {
    @Published var lend: Status
    @Published var lendAllId: ReceiveUserShare
    @Published var parkingId: ReceiveUserShareElement
    @Published var shareRequest: Status
    @Published var receiveAll: RecieveAll
    @Published var allbylendid: RecieveAll
    @Published var borrowId: RecieveAllElement
    
    var userId: String = ""
    var id: String = ""
    
    var receiveURLString: String = "" // https://test.hackathon.sparcs.net/share/lend/all/:userId // https://test.hackathon.sparcs.net/share/lend/:id // http://test.hackathon.sparcs.net/share/borrow/allbyuser/:userId // http://test.hackathon.sparcs.net/share/borrow/allbylendid/:id // https://test.hackathon.sparcs.net/share/borrow/:id
    
    init(lendDataString: Status, lendAllIdDataString: ReceiveUserShare, parkingIdDataString: ReceiveUserShareElement, shareRequestDataString: Status, receiveAllDataString: RecieveAll, borrowIdDataString: RecieveAllElement) {
        self.lend = lendDataString
        self.lendAllId = lendAllIdDataString
        self.parkingId = parkingIdDataString
        self.shareRequest = shareRequestDataString
        self.receiveAll = receiveAllDataString
        self.allbylendid = receiveAllDataString
        self.borrowId = borrowIdDataString
    }

//    func regist() async throws -> Void {
//        // URL
//        guard let registURL = URL(string: registURLString) else {
//            throw DataFetchError.invalidURL
//        }
//        
//        // Request
//        var registRequest = URLRequest(url: registURL)
//        registRequest.httpMethod = "POST"
//        registRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        // Body
//        let RequestBody = [
//            "lenderId": "",
//            "parkingLotName": "이중훈의 주차장",
//            "lenderName": "이중훈",
//            "relation": "소유자",
//            "phoneNumber": "010-6554-6324",
//            "address": "대학로 291",
//            "totalQty": 3,
//            "baseRate": 500,
//            "baseTime": 10,
//            "addRate": 100,
//            "addTime": 5,
//            "operDay": ["월 09:00 17:00", "화 10:00 14:00", "수 10:30 15:30"]
//        ] as [String : Any]
//        
//        registRequest.httpBody = try? JSONSerialization.data(withJSONObject: RequestBody, options: [])
//        
//        // Session
//        let (data, _) = try await URLSession.shared.data(for: registRequest)
//        
//        // Struct로 디코딩
////        print("DEBUG: \(String(data: data, encoding: .utf8)/*!*/)")
//        let decodedData = try JSONDecoder().decode(Status.self, from: data)
//        
//        // Task (Main Thread)
//        DispatchQueue.main.async {
//            self.lend = decodedData
//        }
//        
//        return
//    }
    
    func userAllReceive() async throws -> Void {
        receiveURLString = "https://test.hackathon.sparcs.net/share/lend/all/\(userId)"
        
        // URL
        guard let receiveURLString = URL(string: registURLString) else {
            throw DataFetchError.invalidURL
        }
        
        // Request
        var registRequest = URLRequest(url: receiveURLString)
        registRequest.httpMethod = "GET"
        registRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Session
        let (data, _) = try await URLSession.shared.data(for: registRequest)
        
        // Struct로 디코딩
//        print("DEBUG: \(String(data: data, encoding: .utf8)/*!*/)")
        let decodedContextData = try JSONDecoder().decode(ReceiveUserShare.self, from: data)
        
        // Task (Main Thread)
        DispatchQueue.main.async {
            self.lendAllId = decodedContextData
        }
        
        return
    }
    
    func lendReceive() async throws -> Void {
        receiveURLString = "https://test.hackathon.sparcs.net/share/lend/\(self.id)"
        
        // URL
        guard let receiveURLString = URL(string: registURLString) else {
            throw DataFetchError.invalidURL
        }
        
        // Request
        var registRequest = URLRequest(url: receiveURLString)
        registRequest.httpMethod = "GET"
        registRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Session
        let (data, _) = try await URLSession.shared.data(for: registRequest)
        
        // Struct로 디코딩
//        print("DEBUG: \(String(data: data, encoding: .utf8)/*!*/)")
        let decodedContextData = try JSONDecoder().decode(ReceiveUserShare.self, from: data)
        
        // Task (Main Thread)
        DispatchQueue.main.async {
            self.lendAllId = decodedContextData
        }
        
        return
    }
    
//    func shareRequest() async throws -> Void {
//        // URL
//        guard let receiveURLString = URL(string: sendURLString) else {
//            throw DataFetchError.invalidURL
//        }
//        
//        // Request
//        var registRequest = URLRequest(url: receiveURLString)
//        registRequest.httpMethod = "POST"
//        registRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        // Session
//        let (data, _) = try await URLSession.shared.data(for: registRequest)
//        
//        // Struct로 디코딩
////        print("DEBUG: \(String(data: data, encoding: .utf8)/*!*/)")
//        let decodedContextData = try JSONDecoder().decode(Status.self, from: data)
//        
//        // Task (Main Thread)
//        DispatchQueue.main.async {
//            self.shareRequest = decodedContextData
//        }
//        
//        return
//    }
    
    func receiveAll() async throws -> Void {
        receiveURLString = "https://test.hackathon.sparcs.net/share/borrow/allbyuser/\(self.userId)"
        
        // URL
        guard let receiveURLString = URL(string: registURLString) else {
            throw DataFetchError.invalidURL
        }
        
        // Request
        var registRequest = URLRequest(url: receiveURLString)
        registRequest.httpMethod = "GET"
        registRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Session
        let (data, _) = try await URLSession.shared.data(for: registRequest)
        
        // Struct로 디코딩
        //        print("DEBUG: \(String(data: data, encoding: .utf8)/*!*/)")
        let decodedContextData = try JSONDecoder().decode(RecieveAll.self, from: data)
        
        // Task (Main Thread)
        DispatchQueue.main.async {
            self.receiveAll = decodedContextData
        }
        
        return
    }
    
    
    func allByLenDid() async throws -> Void {
        receiveURLString = "https://test.hackathon.sparcs.net/share/borrow/allbylendid/\(self.id)"
        
        // URL
        guard let receiveURLString = URL(string: registURLString) else {
            throw DataFetchError.invalidURL
        }
        
        // Request
        var registRequest = URLRequest(url: receiveURLString)
        registRequest.httpMethod = "GET"
        registRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Session
        let (data, _) = try await URLSession.shared.data(for: registRequest)
        
        // Struct로 디코딩
        //        print("DEBUG: \(String(data: data, encoding: .utf8)/*!*/)")
        let decodedContextData = try JSONDecoder().decode(RecieveAll.self, from: data)
        
        // Task (Main Thread)
        DispatchQueue.main.async {
            self.allbylendid = decodedContextData
        }
        
        return
    }
    
    func borrowId() async throws -> Void {
        receiveURLString = "https://test.hackathon.sparcs.net/share/borrow/\(self.id)"
        
        // URL
        guard let receiveURLString = URL(string: registURLString) else {
            throw DataFetchError.invalidURL
        }
        
        // Request
        var registRequest = URLRequest(url: receiveURLString)
        registRequest.httpMethod = "GET"
        registRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Session
        let (data, _) = try await URLSession.shared.data(for: registRequest)
        
        // Struct로 디코딩
        //        print("DEBUG: \(String(data: data, encoding: .utf8)/*!*/)")
        let decodedContextData = try JSONDecoder().decode(RecieveAllElement.self, from: data)
        
        // Task (Main Thread)
        DispatchQueue.main.async {
            self.borrowId = decodedContextData
        }
        
        return
    }

}

