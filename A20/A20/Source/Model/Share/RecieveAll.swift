//
//  RecieveUserAll.swift
//  A20
//
//  Created by 드즈 on 2/16/24.
//

import Foundation

typealias RecieveAll = [RecieveAllElement]

struct RecieveAllElement: Codable {
    var id, lendID, borrowerID, borrowerName: String
    var phoneNumber, borrowStartTime, borrowEndTime, carModel: String
    var carNumber: String
    var status: Int

    enum CodingKeys: String, CodingKey {
        case id
        case lendID = "lendId"
        case borrowerID = "borrowerId"
        case borrowerName, phoneNumber, borrowStartTime, borrowEndTime, carModel, carNumber, status
    }
}
