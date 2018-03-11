//
//  UserPostsResponse.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 10.03.2018.
//  Copyright © 2018 pkuzia. All rights reserved.
//

import Foundation
import ObjectMapper

class UserPostsResponse: BaseResponse {
    
    var name: String?
    var posts: [Post]?
    
    override public func mapping(map: Map) {
        name <- map["tumblelog.name"]
        posts <- map["posts"]
    }
}

class Post: BaseResponse {
 
    var type: String? //TODO: ENUM
    var url: String?
    var date: String?
    var avatar: String?
    var title: String?
    var body: String?
    var tags: [String]?
    
    override public func mapping(map: Map) {
        type <- map["type"]
        url <- map["url"]
        date <- map["date"]
        avatar <- map["tumblelog.avatar_url_128"]
        title <- map["regular-title"]
        body <- map["regular-body"]
        tags <- map["tags"]
    }
}
