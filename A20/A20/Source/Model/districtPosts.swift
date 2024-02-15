//
//  districtPost.swift
//  A20
//
//  Created by 드즈 on 2/14/24.
//

import Foundation

struct districtPosts: Codable {
    var posts: [districtPost]
}

struct districtPost: Codable {
    var id: String
    var title, content, district: String
    var area: String
    var tag: String
    var imageUrl: String?
    var userId: String
}
