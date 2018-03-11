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
    lazy var separatorView = UIView()
    lazy var tagListLabel = UILabel()
    
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
        initPostView(post)
    }
    
    fileprivate func initPostView(_ post: Post) {
        initBlogItemHeaderView(post)
        initBlogTextContent(post)
        initSeparatorView()
        initTagListLabel(post)
        
        addSubview(postView)
        postView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsetsMake(10, 10, 10, 10))
        }
        
        postView.backgroundColor = UIColor.white
        postView.layer.cornerRadius = 10
        postView.clipsToBounds = true
    }
    
    fileprivate func initBlogItemHeaderView(_ post: Post) {
        blogItemHeader.initBlogItemHeaderView(post)
        postView.addSubview(blogItemHeader)
        blogItemHeader.snp.makeConstraints { make in
            make.top.equalTo(postView.snp.top)
            make.left.equalTo(postView.snp.left)
            make.right.equalTo(postView.snp.right)
            make.height.equalTo(60)
        }
        
        blogItemHeader.backgroundColor = StyleKit.colorType(color: .blogCellHeader)
    }
    
    
    
    fileprivate func initBlogTextContent(_ post: Post) {
        postView.addSubview(blogTextContent)
        blogTextContent.snp.makeConstraints { make in
            make.top.equalTo(blogItemHeader.snp.bottom).offset(20)
            make.left.equalTo(postView.snp.left).offset(20)
            make.right.equalTo(postView.snp.right).offset(-20)
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
    
    fileprivate func initTagListLabel(_ post: Post) {
        postView.addSubview(tagListLabel)
        tagListLabel.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(10)
            make.left.equalTo(postView.snp.left).offset(20)
            make.width.equalTo(postView.snp.width).multipliedBy(0.7)
            make.height.equalTo(40)
            make.bottom.equalTo(postView.snp.bottom).offset(-10)
        }
        
        tagListLabel.attributedText = StyleKit.attributedText(text: createTagsListLabel(post), attribute: .blogCellTags)
    }
}