//
//  RestClient.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 10.03.2018.
//  Copyright © 2018 pkuzia. All rights reserved.
//

import Foundation
import Moya
import Alamofire

// MARK: - Provider setup

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data
    }
}

public let tumblrProvider = MoyaProvider<TumblrRestClient>(plugins: [NetworkLoggerPlugin(verbose: true,
                                                                                          responseDataFormatter: JSONResponseDataFormatter)])

// MARK: - Provider support

private extension String {
    var urlEscapedString: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

public enum TumblrRestClient {
    case userPostsRequest(UserPostsRequest)
}

extension TumblrRestClient: TargetType {
    
    public var baseURL: URL { return URL(string: "http://")! }
    
    public var path: String {
        switch self {
        case .userPostsRequest(let userPostsRequest):
            return "\(userPostsRequest.name).tumblr.com/api/read/json"
        }
    }
    
    public var method: Moya.Method {
        return .post
    }
    
    public var parameters: [String: Any]? {
        switch self {
        case .userPostsRequest(let userPostsRequest):
            return userPostsRequest.getParameters()
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.queryString
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var validate: Bool {
        return true
    }
    
    public var sampleData: Data {
        return "Sample Data.".data(using: String.Encoding.utf8)!
    }
    
    public var headers: [String : String]? {
        return nil
    }
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}
