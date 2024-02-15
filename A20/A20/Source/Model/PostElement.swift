//
//  PostElement.swift
//  A20
//
//  Created by 드즈 on 2/15/24.
//

import Foundation

struct PostElement: Codable/*, Hashable */{
    var id: String
    var userName: String
    var title: String
    var content: String
    var district: String
    var area: String
    var tag: String
    var imageUrl: String? // MARK: String or Int ? (null 값 처리)
    var userId: String
}
