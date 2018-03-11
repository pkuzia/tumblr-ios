//
//  BlogItemFooter.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 11.03.2018.
//  Copyright © 2018 pkuzia. All rights reserved.
//

import UIKit

class BlogItemFooter: UIView {

    // MARK: - View Elements
    
    lazy var separatorView = UIView()
    lazy var tagListLabel = UILabel()
    lazy var webButton = UIButton()

    var post: Post?
    
    // MARK: - Appearance
    
    func initBlogItemFooterView(_ post: Post?) {
        self.post = post
        initSeparatorView()
        initTagListLabel()
        initWebButton()
    }
    
    fileprivate func initSeparatorView() {
        addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left).offset(20)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(1)
        }
        
        separatorView.backgroundColor = StyleKit.colorType(color: .blogCellHeader)
    }
    
    fileprivate func initTagListLabel() {
        addSubview(tagListLabel)
        tagListLabel.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(10)
            make.left.equalTo(self.snp.left).offset(20)
            make.width.equalTo(self.snp.width).multipliedBy(0.7)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
        
        tagListLabel.attributedText = StyleKit.attributedText(text: createTagsListLabel(), attribute: .blogCellTags)
    }
    
    fileprivate func initWebButton() {
        addSubview(webButton)
        webButton.snp.makeConstraints { make in
            make.centerY.equalTo(tagListLabel.snp.centerY)
            make.right.equalTo(self.snp.right).offset(-20)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        if let webImage = UIImage(named: "web") {
             webButton.setImageForAllStates(webImage)
        }
    }
        
    func createTagsListLabel() -> String {
        var tagString = ""
        if let tags = post?.tags {
            tags.forEach({ tag in
                tagString.append(" #\(tag)")
            })
        }
        return tagString
    }
}
