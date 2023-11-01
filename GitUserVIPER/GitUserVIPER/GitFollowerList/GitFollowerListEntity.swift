//
//  GitFollowerListEntity.swift
//  GitUserVIPER
//
//  Created by Sandeep Khade on 07/10/23.
//

import Foundation


struct Followers: Codable {
    
    var id: Int
    var name: String?
    var avatarUrl: String?
    var userDetails: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case avatarUrl = "avatar_url"
        case userDetails = "url"
    }
}
