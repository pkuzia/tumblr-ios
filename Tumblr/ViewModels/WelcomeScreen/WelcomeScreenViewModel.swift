//
//  WelcomeScreenViewModel.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 10.03.2018.
//  Copyright © 2018 pkuzia. All rights reserved.
//

import UIKit

protocol WelcomeScreenViewModelDelegate: class {
    
}

class WelcomeScreenViewModel: BaseViewModel {
    
    // MARK: - Strings
    
    let searchButtonTitle = "welcome_search_button_title".localized()
    let textFieldPlaceholder = "welcome_textfield_placeholder".localized()
    let searchSpinnerText = "welcome_search_text".localized()
    
    // MARK: - View Model Data
    
    let logoImageName = "tumblrLogo"
    
    weak var delegate: WelcomeScreenViewModelDelegate?
    let tumblrService = TumblrService()
    
    var userPostsResponse: UserPostsResponse?
    
    // MARK: - Functions
    
    func userPosts(name: String, completionHandler: @escaping (FetchResult) -> ()) {
        let userPostsRequest = UserPostsRequest(name: name)
        
        tumblrService.userPosts(userPostsRequest: userPostsRequest) { result, userPostsResponse in
            DispatchQueue.main.async {
                if result.error != nil {
                    completionHandler(result)
                } else {
                    if let userPostsResponse = userPostsResponse {
                        self.userPostsResponse = userPostsResponse
                        completionHandler(FetchResult(error: nil))
                    } else {
                        completionHandler(FetchResult(error: .unknownError))
                    }
                }
            }
        }
    }
}


