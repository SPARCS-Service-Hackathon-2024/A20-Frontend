//
//  LoginResponse.swift
//  A20
//
//  Created by 드즈 on 2/14/24.
//

import Foundation

struct LoginResponse: Codable {
    var user: User
    var token: String
}

struct User: Codable {
    var name: String
    var email: String
    var password: String
    
    // MARK: String or Int ? (null 값 처리)
    var carType: String?
    var carNumber: String?
    
    var id: String
}
