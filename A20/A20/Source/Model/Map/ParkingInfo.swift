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
}

typealias ParkingInfo = [ParkingInfoElement]
