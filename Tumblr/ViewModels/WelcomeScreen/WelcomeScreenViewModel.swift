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
    
    // MARK: - View Model Data
    
    let logoImageName = "tumblrLogo"
    weak var delegate: WelcomeScreenViewModelDelegate?
    
    // MARK: - Functions
}


