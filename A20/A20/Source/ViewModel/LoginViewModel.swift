//
//  LoginViewModel.swift
//  A20
//
//  Created by 드즈 on 2/14/24.
//

import SwiftUI

fileprivate let registURLString: String = "https://test.hackathon.sparcs.net/auth/register"
fileprivate let loginURLString: String = "https://test.hackathon.sparcs.net/auth/login"

//@MainActor // or Task (Main Thread)
class LoginViewModel: ObservableObject {
    @Published var regist: LoginResponse
    @Published var login: LoginResponse
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var id: String = ""
    @Published var token: String = ""
    
    init(registDataString: LoginResponse, loginDataString: LoginResponse) {
        self.regist = registDataString
        self.login = loginDataString
    }
    
    func regist() async throws -> Void {
        // URL
        guard let registURL = URL(string: registURLString) else {
            throw DataFetchError.invalidURL
        }
        
        // Request
        var registRequest = URLRequest(url: registURL)
        registRequest.httpMethod = "POST"
        registRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Body
        let RequestBody = ["name": self.name, "email": self.email, "password": self.password]
        registRequest.httpBody = try? JSONSerialization.data(withJSONObject: RequestBody, options: [])
        
        // Session
        let (data, _) = try await URLSession.shared.data(for: registRequest)
        
        // Struct로 디코딩
//        print("DEBUG: \(String(data: data, encoding: .utf8)/*!*/)")
        let decodedContextData = try JSONDecoder().decode(LoginResponse.self, from: data)
        
        // Task (Main Thread)
        DispatchQueue.main.async {
            self.regist = decodedContextData
        }
        
        return
    }
    
    func login() async throws -> Void {
        // URL
        guard let registURL = URL(string: loginURLString) else {
            throw DataFetchError.invalidURL
        }
        
        // Request
        var loginRequest = URLRequest(url: registURL)
        loginRequest.httpMethod = "POST"
        loginRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Body
        let RequestBody = ["email": self.email, "password": self.password]
        loginRequest.httpBody = try? JSONSerialization.data(withJSONObject: RequestBody, options: [])
        
        // Session
        let (data, _) = try await URLSession.shared.data(for: loginRequest)
        
        // Struct로 디코딩
        print("DEBUG: \(String(data: data, encoding: .utf8)/*!*/)")
        let decodedContextData = try JSONDecoder().decode(LoginResponse.self, from: data)
        
        // Task (Main Thread)
        DispatchQueue.main.async {
            self.login = decodedContextData
        }
        
        return
    }
}
