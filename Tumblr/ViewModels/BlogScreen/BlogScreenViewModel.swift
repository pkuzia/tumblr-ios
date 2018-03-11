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
    
    // MARK: - View Model Data
    
    weak var delegate: BlogScreenViewModelDelegate?
    
    // MARK: - Functions
}


