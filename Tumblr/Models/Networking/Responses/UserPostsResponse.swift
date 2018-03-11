//
//  UserPostsResponse.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 10.03.2018.
//  Copyright © 2018 pkuzia. All rights reserved.
//

import Foundation
import ObjectMapper

enum PostType: String {
    case regular = "regular"
    case photo = "photo"
}

class UserPostsResponse: BaseResponse {
    
    var posts: [Post]?
    
    override public func mapping(map: Map) {
        posts <- map["posts"]
    }
}

class Post: BaseResponse {
 
    var type: PostType?
    var url: String?
    var name: String?
    var date: String?
    var avatar: String?
    var title: String?
    var body: String?
    var tags: [String]?
    var photoCaption: String?
    var photoURL: String?
    
    override public func mapping(map: Map) {
        type <- (map["type"], EnumTransform<PostType>())
        url <- map["url"]
        date <- map["date"]
        avatar <- map["tumblelog.avatar_url_128"]
        title <- map["regular-title"]
        body <- map["regular-body"]
        tags <- map["tags"]
        photoCaption <- map["photo-caption"]
        photoURL <- map["photo-url-1280"]
        name <- map["tumblelog.name"]
    }
}
