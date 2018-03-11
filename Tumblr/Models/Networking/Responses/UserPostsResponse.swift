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
    
    var lat: Double?
    var lng: Double?
    
    override public func mapping(map: Map) {
        lat <- map["results.0.geometry.location.lat"]
        lng <- map["results.0.geometry.location.lng"]
    }
}
