//
//  ParkingDetail.swift
//  A20
//
//  Created by 드즈 on 2/16/24.
//

import Foundation

struct ParkingDetail: Codable {
    var name, lat, lon, address: String
    var tel, totalQty, resQty, type: String
    var baseTime, baseRate, addTime, addRate: String
    var extraBaseTime, extraAddTime, extraAddRate, weekdayOpenTime: String
    var weekdayCloseTime, operDay, id: String
}
