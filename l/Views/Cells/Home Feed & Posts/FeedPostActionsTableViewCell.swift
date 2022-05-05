//
//  FeedPostActionsTableViewCell.swift
//  l
//
//  Created by user217575 on 4/29/22.
//

import UIKit

protocol FeedPostActionsTableViewCellDelegate: AnyObject{
    func didTapLikeButton()
    func didTapCommentButton()
}

class FeedPostActionsTableViewCell: UITableViewCell {
    
    weak var delegate: FeedPostActionsTableViewCellDelegate?

    static let identifier = "FeedPostActionsTableViewCell"
    
    private let likeButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular)
        let image = UIImage(systemName: "hand.thumbsup",withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular)
        let image = UIImage(systemName: "message",withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .label
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
        
        likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
        commentButton.addTarget(self, action: #selector(didTapCommentButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapLikeButton() {
        delegate?.didTapLikeButton()
    }
    
    @objc private func didTapCommentButton(){
        delegate?.didTapCommentButton()
    }
    
    public func configure(with post: UserPost){
        //configure the cell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let buttonSize = contentView.height-10
        
        let buttons = [likeButton, commentButton]
        for x in 0..<buttons.count {
            let button = buttons[x]
            button.frame = CGRect(x: (CGFloat(x)*buttonSize) + (10*CGFloat(x+1)), y: 5, width: buttonSize, height: buttonSize)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
