//
//  PhotoBlogCell.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 11.03.2018.
//  Copyright © 2018 pkuzia. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoBlogCell: BaseBlogCell {

    // MARK: - View Elements
    
    lazy var postView = UIView()
    lazy var blogItemHeader = BlogItemHeader()
    lazy var photoTitle = UILabel()
    lazy var blogPhoto = UIImageView()
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
        initPhotoTitle()
        initBlogPhoto()
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
    
    fileprivate func initPhotoTitle() {
        postView.addSubview(photoTitle)
        photoTitle.snp.makeConstraints { make in
            make.top.equalTo(blogItemHeader.snp.bottom).offset(20)
            make.left.equalTo(postView.snp.left).offset(20)
            make.right.equalTo(postView.snp.right).offset(-20)
        }
        photoTitle.numberOfLines = 0
        if let photoTitleText = post?.photoCaption {
            photoTitle.setHTMLFromString(text: photoTitleText)
        }
    }
        
    fileprivate func initBlogPhoto() {
        postView.addSubview(blogPhoto)
        blogPhoto.snp.makeConstraints { make in
            make.top.equalTo(photoTitle.snp.bottom)
            make.left.equalTo(postView.snp.left).offset(-10)
            make.right.equalTo(postView.snp.right).offset(10)
            make.height.equalTo(200)
        }
        blogPhoto.contentMode = .scaleAspectFill
        if let photoUrl = post?.photoURL, let url = URL(string: photoUrl) {
            blogPhoto.kf.indicatorType = .activity
            blogPhoto.kf.setImage(with: url)
        }
    }
    
    fileprivate func initBlogItemFooterView() {
        blogItemFooter.initBlogItemFooterView(post)
        postView.addSubview(blogItemFooter)
        blogItemFooter.snp.makeConstraints { make in
            make.top.equalTo(blogPhoto.snp.bottom)
            make.left.equalTo(postView.snp.left)
            make.right.equalTo(postView.snp.right)
            make.bottom.equalTo(postView.snp.bottom)
            make.height.equalTo(60)
        }
    }
    
}
