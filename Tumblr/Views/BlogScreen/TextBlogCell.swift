//
//  TextBlogCell.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 11.03.2018.
//  Copyright © 2018 pkuzia. All rights reserved.
//

import UIKit
import Kingfisher
import TagListView

class TextBlogCell: UITableViewCell {

    // MARK: - View Elements
    
    lazy var postView = UIView()
    lazy var headerView = UIView()
    lazy var authorAvatar = UIImageView()
    lazy var authorName = UILabel()
    lazy var blogTextContent = UILabel()
    lazy var separatorView = UIView()
    lazy var tagListView = TagListView()
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Appearance
    
    func initCell(post: Post) {
        backgroundColor = UIColor.clear
        initPostView()
        initHeaderView()
        initAuthorAvatar(post)
        initAuthorName(post)
        initBlogTextContent(post)
        initSeparatorView()
        initTagListView(post)
    }
    
    fileprivate func initPostView() {
        addSubview(postView)
        postView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsetsMake(10, 10, 10, 10))
        }
        
        postView.backgroundColor = UIColor.white
        postView.layer.cornerRadius = 10
        postView.clipsToBounds = true
    }
    
    fileprivate func initHeaderView() {
        postView.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalTo(postView.snp.top)
            make.left.equalTo(postView.snp.left)
            make.right.equalTo(postView.snp.right)
            make.height.equalTo(60)
        }
        
        headerView.backgroundColor = StyleKit.colorType(color: .blogCellHeader)
    }
    
    fileprivate func initAuthorAvatar(_ post: Post) {
        headerView.addSubview(authorAvatar)
        authorAvatar.snp.makeConstraints { make in
            make.height.equalTo(headerView.snp.height).multipliedBy(0.7)
            make.width.equalTo(authorAvatar.snp.height)
            make.left.equalTo(headerView.snp.left).offset(12)
            make.centerY.equalTo(headerView.snp.centerY)
        }
        
        if let avatarUrl = post.avatar, let url = URL(string: avatarUrl) {
            authorAvatar.layer.masksToBounds = true
            authorAvatar.layer.cornerRadius = authorAvatar.frame.height / 2
            authorAvatar.kf.setImage(with: url)
        }
    }
    
    fileprivate func initAuthorName(_ post: Post) {
        headerView.addSubview(authorName)
        authorName.snp.makeConstraints { make in
            make.left.equalTo(authorAvatar.snp.right).offset(20)
            make.centerY.equalTo(headerView.snp.centerY)
        }
        
        if let name = post.name {
            authorName.attributedText = StyleKit.attributedText(text: name, attribute: .blogCellAuthorName)
        }
    }
    
    fileprivate func initBlogTextContent(_ post: Post) {
        postView.addSubview(blogTextContent)
        blogTextContent.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(20)
            make.left.equalTo(postView.snp.left).offset(20)
            make.right.equalTo(postView.snp.right).offset(-20)
            make.bottom.equalTo(postView.snp.bottom).offset(-20)
        }
        
        if let postContent = post.body {
            blogTextContent.setHTMLFromString(text: postContent)
        }
        blogTextContent.numberOfLines = 0
    }
    
    fileprivate func initSeparatorView() {
        postView.addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(blogTextContent.snp.bottom).offset(0)
            make.left.equalTo(postView.snp.left).offset(20)
            make.right.equalTo(postView.snp.right).offset(0)
            make.height.equalTo(1)
        }
        
        separatorView.backgroundColor = StyleKit.colorType(color: .blogCellHeader)
    }
    
    fileprivate func initTagListView(_ post: Post) {
        postView.addSubview(tagListView)
        tagListView.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(10)
            make.left.equalTo(postView.snp.left).offset(20)
            make.width.equalTo(postView.snp.width).multipliedBy(0.5)
        }
        
        if let tags = post.tags {
            tagListView.addTags(tags)
        }
    }
}
