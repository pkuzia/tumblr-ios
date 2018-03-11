//
//  BaseBlogCell.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 11.03.2018.
//  Copyright © 2018 pkuzia. All rights reserved.
//

import UIKit

class BaseBlogCell: UITableViewCell {

     // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
     // MARK: - Helper functions
    
    func createTagsListLabel(_ post: Post) -> String {
        var tagString = ""
        if let tags = post.tags {
            tags.forEach({ tag in
                tagString.append(" #\(tag)")
            })
        }
        return tagString
    }

}