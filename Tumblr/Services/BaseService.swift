//
//  BaseService.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 10.03.2018.
///  Copyright © 2018 pkuzia. All rights reserved.
//

import Foundation
import Moya_ObjectMapper
import Moya
import Result

public struct FetchResult {
    let error: FetchError?
}

enum FetchError: Swift.Error {
    case connectionError
    case userNotFound
    case parseError
    case unknownError
    case errorMessage(String)
    
    var description: String {
        switch self {
        case .connectionError:
            return "There was an connection error"
        case .errorMessage(let error):
            return error
        case .parseError:
            return "There was an parsing error"
        case .unknownError:
            return "There was an unknown error"
        case .userNotFound:
            return "User not found"
        }
    }
}

class BaseService {
    
    func handleMoyaResultWithMappingObject<T: BaseResponse>(result: Result<Moya.Response, MoyaError>,
                                                            completionHandler: @escaping (FetchResult, T?) -> ()) {
        switch result {
        case let .success(response):
            do {
                let validResponse = try response.filterSuccessfulStatusCodes()
                let response: T? = try validResponse.mapObject(T.self)
                
                if let response = response {
                    completionHandler(FetchResult(error: nil), response)
                } else {
                    completionHandler(FetchResult(error: .parseError), nil)
                }
            } catch let error as MoyaError {
                switch error {
                case .statusCode(_): do {
                    completionHandler(FetchResult(error: .connectionError), nil)
                    }
                case .jsonMapping(_): do {
                    completionHandler(FetchResult(error: .parseError), nil)
                    }
                default:
                    completionHandler(FetchResult(error: .unknownError), nil)
                }
            }
            catch {
                completionHandler(FetchResult(error: .unknownError), nil)
            }
        case let .failure(error):
            guard let errorDescription = error.errorDescription, let statusCode = error.response?.statusCode else {
                completionHandler(FetchResult(error: .unknownError), nil)
                return
            }
            switch statusCode {
            case 404:
                completionHandler(FetchResult(error: .userNotFound), nil)
            default:
                completionHandler(FetchResult(error: .errorMessage(errorDescription)), nil)
            }
        }
    }
}
