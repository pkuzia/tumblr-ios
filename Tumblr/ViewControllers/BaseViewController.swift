//
//  BaseViewController.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 7/29/17
//  Copyright © 2018 pkuzia. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    let baseViewModel = BaseViewModel()
    
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
    }
    
    // MARK: - Appearance
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Functions
    
}
