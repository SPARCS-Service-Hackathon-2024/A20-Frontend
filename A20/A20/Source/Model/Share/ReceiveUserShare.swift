//
//  ReceiveUserShare.swift
//  A20
//
//  Created by 드즈 on 2/16/24.
//

import Foundation

typealias ReceiveUserShare = [ReceiveUserShareElement]

struct ReceiveUserShareElement: Codable {
    var id, lenderID, parkingLotName, lenderName: String
    var relation, phoneNumber, address: String
    var lat, lon: Double
    var totalQty, resQty, baseRate, baseTime: Int
    var addRate, addTime: Int
    var operDay: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case lenderID = "lenderId"
        case parkingLotName, lenderName, relation, phoneNumber, address, lat, lon, totalQty, resQty, baseRate, baseTime, addRate, addTime, operDay
    }
}
