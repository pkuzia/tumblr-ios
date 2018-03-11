//
//  TextBlogCell.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 11.03.2018.
//  Copyright © 2018 pkuzia. All rights reserved.
//

import UIKit
import Kingfisher

class TextBlogCell: BaseBlogCell {
    
    // MARK: - View Elements
    
    lazy var postView = UIView()
    lazy var blogItemHeader = BlogItemHeader()
    lazy var blogTextContent = UILabel()
    lazy var blogItemFooter = BlogItemFooter()
    
    var post: Post?
    
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
        selectionStyle = .none
        self.post = post
        initPostView()
    }
    
    fileprivate func initPostView() {
        initBlogItemHeaderView()
        initBlogTextContent()
        initBlogItemFooterView()
        
        addSubview(postView)
        postView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsetsMake(10, 10, 10, 10))
        }
        
        postView.backgroundColor = UIColor.white
        postView.layer.cornerRadius = 10
        postView.clipsToBounds = true
    }
    
    fileprivate func initBlogItemHeaderView() {
        blogItemHeader.initBlogItemHeaderView(post)
        postView.addSubview(blogItemHeader)
        blogItemHeader.snp.makeConstraints { make in
            make.top.equalTo(postView.snp.top)
            make.left.equalTo(postView.snp.left)
            make.right.equalTo(postView.snp.right)
            make.height.equalTo(60)
        }
    }
    
    fileprivate func initBlogTextContent() {
        postView.addSubview(blogTextContent)
        blogTextContent.snp.makeConstraints { make in
            make.top.equalTo(blogItemHeader.snp.bottom).offset(20)
            make.left.equalTo(postView.snp.left).offset(20)
            make.right.equalTo(postView.snp.right).offset(-20)
        }
        
        if let postContent = post?.body {
            blogTextContent.setHTMLFromString(text: postContent)
        }
        blogTextContent.numberOfLines = 0
    }
    
    fileprivate func initBlogItemFooterView() {
        blogItemFooter.initBlogItemFooterView(post)
        postView.addSubview(blogItemFooter)
        blogItemFooter.snp.makeConstraints { make in
            make.top.equalTo(blogTextContent.snp.bottom)
            make.left.equalTo(postView.snp.left)
            make.right.equalTo(postView.snp.right)
            make.bottom.equalTo(postView.snp.bottom)
            make.height.equalTo(60)
        }
    }
}
