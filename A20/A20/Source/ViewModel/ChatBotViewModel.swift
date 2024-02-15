//
//  ChatBotViewModel.swift
//  A20
//
//  Created by 드즈 on 2/14/24.
//

import SwiftUI

fileprivate let chatURLString: String = "http://{SERVER_URL}/openai/ask"

//@MainActor // or Task (Main Thread)
class ChatBotViewModel: ObservableObject {
    @Published var chat: ChatResponse
    
    @Published var request: String = ""
    
    @Published var id: String = ""
    @Published var token: String = ""
    
    init(chatDataString: ChatResponse) {
        self.chat = chatDataString
    }
    
    func regist() async throws -> Void {
        // URL
        guard let chatURL = URL(string: chatURLString) else {
            throw DataFetchError.invalidURL
        }
        
        // Request
        var chatRequest = URLRequest(url: chatURL)
        chatRequest.httpMethod = "POST"
        chatRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        chatRequest.addValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
        
        // Body
        let RequestBody = ["prompt": self.request]
        chatRequest.httpBody = try? JSONSerialization.data(withJSONObject: RequestBody, options: [])
        
        // Session
        let (data, _) = try await URLSession.shared.data(for: chatRequest)
        
        // Struct로 디코딩
        //        print("DEBUG: \(String(data: data, encoding: .utf8)/*!*/)")
        let decodedContextData = try JSONDecoder().decode(ChatResponse.self, from: data)
        
        // Task (Main Thread)
        DispatchQueue.main.async {
            self.chat = decodedContextData
        }
        
        return
    }
}
