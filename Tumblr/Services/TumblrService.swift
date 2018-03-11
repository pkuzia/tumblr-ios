//
//  TumblrService.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 10.03.2018.
//  Copyright © 2018 pkuzia. All rights reserved.
//

import Foundation

class TumblrService: BaseService {
 
    func userPosts(userPostsRequest: UserPostsRequest, completionHandler: @escaping (FetchResult, UserPostsResponse?) -> ()) {
        tumblrProvider.request(.userPostsRequest(userPostsRequest)) { result in
            self.handleMoyaResultWithMappingObject(result: result, completionHandler: completionHandler)
        }
    }
}
