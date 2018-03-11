//
//  BlogScreenViewController.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 11.03.2018.
//Copyright © 2018 pkuzia. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

class BlogScreenViewController: BaseViewController {
    
    // MARK: - View Elements
    
    lazy var tableView = UITableView()
    
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
        initTableView()
        view.backgroundColor = StyleKit.colorType(color: .navyBlueBackground)
    }
    
    fileprivate func initTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(64, 0, 0, 0))
        }
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300.0
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PhotoBlogCell.self, forCellReuseIdentifier: blogScreenViewModel.photoBlogCellIdentifier)
        tableView.register(TextBlogCell.self, forCellReuseIdentifier: blogScreenViewModel.textBlogCellIdentifier)
    }
    // MARK: - User Interaction
    
    // MARK: - Additional Helpers
    
}

// MARK: - BlogScreebViewModelDelegate

extension BlogScreenViewController: BlogScreenViewModelDelegate {
    
}

// MARK: - BlogScreebViewModelDelegate

extension BlogScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let posts = blogScreenViewModel.userPostsResponse?.posts {
            //TODO: Limit
            return posts.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let posts = blogScreenViewModel.userPostsResponse?.posts, let post = posts.item(at: indexPath.row),
            let postType = post.type else {
                return UITableViewCell()
        }
        
        switch postType {
        case .regular:
            if let cell = tableView.dequeueReusableCell(withIdentifier: blogScreenViewModel.textBlogCellIdentifier, for: indexPath) as? TextBlogCell {
                cell.initCell(post: post)
                return cell
            }
        case .photo:
            if let cell = tableView.dequeueReusableCell(withIdentifier: blogScreenViewModel.photoBlogCellIdentifier, for: indexPath) as? PhotoBlogCell {
                cell.initCell(post: post)
                return cell
            }
        }
        
        return UITableViewCell()
    }
}

