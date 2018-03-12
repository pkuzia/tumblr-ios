//
//  BaseBlogCell.swift
//  Tumblr
//
//  Created by Przemysław Kuzia on 11.03.2018.
//  Copyright © 2018 pkuzia. All rights reserved.
//

import UIKit

protocol BaseBlogCellDelegate: class {
    func webButtonClick(url: String?)
}

class BaseBlogCell: UITableViewCell {

    weak var baseBlogCellDelegate: BaseBlogCellDelegate?
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
     // MARK: - Helper functions

}
