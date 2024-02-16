//
//  PostElement.swift
//  A20
//
//  Created by 드즈 on 2/15/24.
//

import Foundation

struct PostElement: Codable {
    var id: String
    var title: String
    var content: String
    var district: String
    var area: String
    var imageUrl: String?
    var tag: String
    var userId: String
    var userName: String
}
