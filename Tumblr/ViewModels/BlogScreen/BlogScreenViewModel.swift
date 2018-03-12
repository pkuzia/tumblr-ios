//
//  BlogScreenViewModel.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 11.03.2018.
//Copyright © 2018 pkuzia. All rights reserved.
//

import UIKit

protocol BlogScreenViewModelDelegate: class {
    
}

class BlogScreenViewModel: BaseViewModel {
    
    // MARK: - Strings
    
    let screenTitle = "blog_screen_title".localized()
    
    // MARK: - View Model Data
    
    let textBlogCellIdentifier = "textCell"
    let photoBlogCellIdentifier = "photoCell"
    
    var userPostsResponse: UserPostsResponse?
    weak var delegate: BlogScreenViewModelDelegate?
    
    // MARK: - Functions
}


