//
//  BlogScreenViewController.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 11.03.2018.
//Copyright © 2018 pkuzia. All rights reserved.
//

import UIKit

class BlogScreenViewController: BaseViewController {
    
    // MARK: - Outlets
    
    let blogScreenViewModel = BlogScreenViewModel()
    
    // MARK: - View Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    // MARK: - Appearance
    
    func initUI() {
        
    }
    
    // MARK: - User Interaction
    
    // MARK: - Additional Helpers
    
}

// MARK: - BlogScreebViewModelDelegate

extension BlogScreenViewController: BlogScreenViewModelDelegate {
    
}

