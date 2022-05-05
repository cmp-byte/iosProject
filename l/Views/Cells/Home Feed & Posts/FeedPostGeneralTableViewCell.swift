//
//  FeedPostGeneralTableViewCell.swift
//  l
//
//  Created by user217575 on 4/29/22.
//

import UIKit

//comments and such
class FeedPostGeneralTableViewCell: UITableViewCell {

    static let identifier = "FeedPostGeneralTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemYellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(){
        //configure the cell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
