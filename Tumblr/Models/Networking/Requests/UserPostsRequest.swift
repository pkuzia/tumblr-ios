//
//  UserPostsRequest.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 10.03.2018.
//  Copyright © 2018 pkuzia. All rights reserved.
//

public class UserPostsRequest: BaseRequest {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }

    public func getParameters() -> [String: Any]? {
        var parameters: [String: Any] = [:]
        return parameters
    }
}
