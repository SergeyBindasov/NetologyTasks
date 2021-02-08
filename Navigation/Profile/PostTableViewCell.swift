//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Sergey on 28.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var content: PostStruct? {
        didSet {
            guard let content = content else { return }
            postAuthor.text = content.author
            postImageView.image = content.image
            postDescription.text = content.description
            postLikes.text = String("Likes: \(content.likes)")
            postViews.text = String("Views: \(content.views)")
        }
    }
    
    private var postAuthor: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        text.numberOfLines = 2
        text.textColor = .black
        return text
    }()

    private var postImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        return image
    }()
    
    private var postDescription: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        description.numberOfLines = 0
        description.textColor = .gray
        return description
    }()
    
    private var postLikes: UILabel = {
        let likes = UILabel()
        likes.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likes.textColor = .black
        return likes
    }()
    
    private var postViews: UILabel = {
        let views = UILabel()
        views.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        views.textColor = .black
        return views
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        contentView.addSubviews(postAuthor, postImageView, postDescription, postLikes, postViews)
        
        let constraints = [
            postAuthor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.topAnchor.constraint(equalTo: postAuthor.bottomAnchor, constant: 12),
            postImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postDescription.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            postLikes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postViews.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
