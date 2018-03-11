//
//  BlogItemHeader.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 11.03.2018.
//  Copyright © 2018 pkuzia. All rights reserved.
//

import UIKit
import Kingfisher

class BlogItemHeader: UIView {

    // MARK: - View Elements
    
    lazy var authorAvatar = UIImageView()
    lazy var authorName = UILabel()
    lazy var postDate = UILabel()
    
    var post: Post?
    
    // MARK: - Appearance
    
    func initBlogItemHeaderView(_ post: Post?) {
        self.post = post
        backgroundColor = StyleKit.colorType(color: .blogCellHeader)
        initAuthorAvatar()
        initAuthorName()
        initPostDate()
    }

    fileprivate func initAuthorAvatar() {
        addSubview(authorAvatar)
        authorAvatar.snp.makeConstraints { make in
            make.height.equalTo(self.snp.height).multipliedBy(0.7)
            make.width.equalTo(authorAvatar.snp.height)
            make.left.equalTo(self.snp.left).offset(20)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        if let avatarUrl = post?.avatar, let url = URL(string: avatarUrl) {
            authorAvatar.layer.masksToBounds = true
            authorAvatar.layer.cornerRadius = authorAvatar.frame.height / 2
            authorAvatar.kf.setImage(with: url)
        }
    }
    
    fileprivate func initAuthorName() {
        addSubview(authorName)
        authorName.snp.makeConstraints { make in
            make.left.equalTo(authorAvatar.snp.right).offset(20)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        if let name = post?.name {
            authorName.attributedText = StyleKit.attributedText(text: name, attribute: .blogCellAuthorName)
        }
    }
    
    fileprivate func initPostDate() {
        addSubview(postDate)
        postDate.snp.makeConstraints { make in
            make.right.equalTo(self.snp.right).offset(-20)
            make.width.equalTo(self.snp.width).multipliedBy(0.3)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        if let date = post?.date {
            postDate.attributedText = StyleKit.attributedText(text: date, attribute: .blogCellDate)
        }
        postDate.numberOfLines = 2
    }
}
