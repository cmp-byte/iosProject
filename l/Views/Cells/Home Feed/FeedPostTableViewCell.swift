//
//  FeedPostTableViewCell.swift
//  l
//
//  Created by user217575 on 4/29/22.
//

import UIKit

class FeedPostTableViewCell: UITableViewCell {

    static let identifier = "FeedPostTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(){
        //configure the cell
    }

}
