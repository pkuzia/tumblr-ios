//
//  MainNavigationViewController.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 10.03.2018.
//  Copyright © 2018 pkuzia. All rights reserved.
//

import UIKit

class MainNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    fileprivate func initUI() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.tintColor = StyleKit.colorType(color: .navBarTintColor)
        navigationBar.titleTextAttributes = StyleKit.attributedText(attribute: .navBarTitle)
        UIApplication.shared.statusBarStyle = .lightContent
    }
}
