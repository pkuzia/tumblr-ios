//
//  WelcomeScreenViewController.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 10.03.2018.
//  Copyright © 2018 pkuzia. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

class WelcomeScreenViewController: BaseViewController {
    
    // MARK: - View Elements
    
    lazy var logo = UIImageView()
    lazy var searchButton = UIButton()
    lazy var textField = UITextField()
    
    let welcomeScreenViewModel = WelcomeScreenViewModel()
    
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
        initLogo()
        initSearchButton()
        initTextField()
        view.backgroundColor = StyleKit.colorType(color: .welcomeNavyBlueBackground)
    }
    
    fileprivate func initLogo() {
        view.addSubview(logo)
        logo.snp.makeConstraints { make in
            make.width.equalTo(self.view).dividedBy(2.4)
            make.height.equalTo(logo.snp.width)
            make.top.equalTo(self.view.snp.top).offset(80)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        logo.image = UIImage(named: welcomeScreenViewModel.logoImageName)
    }
    
    fileprivate func initTextField() {
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.width.equalTo(self.view).dividedBy(1.2)
            make.height.equalTo(60)
            make.centerX.equalTo(self.view.snp.centerX)
            make.bottom.equalTo(self.searchButton.snp.top).offset(-20)
        }
        
        textField.backgroundColor = StyleKit.colorType(color: .welcomeTextFieldBackground)
        textField.layer.cornerRadius = 5
        textField.attributedPlaceholder = StyleKit.attributedText(text: welcomeScreenViewModel.textFieldPlaceholder,
                                                                  attribute: .welcomeTextFieldPlaceholder)
    }
    
    fileprivate func initSearchButton() {
        view.addSubview(searchButton)
        searchButton.snp.makeConstraints { make in
            make.width.equalTo(self.view).dividedBy(1.2)
            make.height.equalTo(60)
            make.centerX.equalTo(self.view.snp.centerX)
            make.bottom.equalTo(self.view.snp.bottom).offset(-80)
        }
        
        searchButton.backgroundColor = StyleKit.colorType(color: .welcomeSearchButtonColor)
        searchButton.setAttributedTitle(StyleKit.attributedText(text: welcomeScreenViewModel.searchButtonTitle,
                                                                attribute: .welcomeSearchButtonTitle), for: .normal)
        searchButton.layer.cornerRadius = 5
        searchButton.addTarget(self, action: #selector(searchUserButtonClick), for: .touchUpInside)
    }
    
    // MARK: - User Interaction
    
    @objc func searchUserButtonClick(sender: UIButton!) {
        welcomeScreenViewModel.userPosts(name: "przemex3000") { _ in
            
        }
    }
    
    // MARK: - Additional Helpers
    
}

// MARK: - WelcomeScreenViewModelDelegate

extension WelcomeScreenViewController: WelcomeScreenViewModelDelegate {
    
}

