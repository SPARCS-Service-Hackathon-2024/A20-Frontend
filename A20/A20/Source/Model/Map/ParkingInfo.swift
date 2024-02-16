//
//  ParkingInfo.swift
//  A20
//
//  Created by 드즈 on 2/16/24.
//

import Foundation

struct ParkingInfoElement: Codable {
    var lat : String
    var lon: String
    var id: String
    var isShared: String
    
    enum CodingKeys: String, CodingKey {
        case id, lat, lon, isShared
    }
}

typealias ParkingInfo = [ParkingInfoElement]
