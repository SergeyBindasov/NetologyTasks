//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Sergey on 28.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import StorageService

class PostTableViewCell: UITableViewCell {
    
    var content: Post? {
        didSet {
            guard let content = content else { return }
            postAuthor.text = content.author
            postImageView.image = content.image
            postDescription.text = content.description
            postLikes.text = String("Likes: \(content.likes)")
            postViews.text = String("Views: \(content.views)")
        }
    }
    
    var savedContent: SavedPost? {
        didSet {
            guard let savedContent = savedContent else { return }
            postAuthor.text = savedContent.author
            postImageView.image = UIImage(data: savedContent.image!)
            postDescription.text = savedContent.postDescription
            postLikes.text = String("Likes: \(savedContent.likes)")
            postViews.text = String("Views: \(savedContent.views)")
    }
    }
    
    private var postAuthor: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        text.numberOfLines = 2
        text.textColor = UIColor.createColor(lightMode: UIColor(named: "text")!, darkMode: UIColor(named: "text")!)
        text.toAutoLayuot()
        return text
    }()

    private var postImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.toAutoLayuot()
        return image
    }()
    
    private var postDescription: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        description.numberOfLines = 0
        description.textColor = UIColor.createColor(lightMode: UIColor(named: "text")!, darkMode: UIColor(named: "text")!)
        description.toAutoLayuot()
        return description
    }()
    
    private var postLikes: UILabel = {
        let likes = UILabel()
        likes.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likes.textColor = UIColor.createColor(lightMode: UIColor(named: "text")!, darkMode: UIColor(named: "text")!)
        likes.toAutoLayuot()
        return likes
    }()
    
    private var postViews: UILabel = {
        let views = UILabel()
        views.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        views.textColor = UIColor.createColor(lightMode: UIColor(named: "text")!, darkMode: UIColor(named: "text")!)
        views.toAutoLayuot()
        return views
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    private func setupLayout() {
        contentView.backgroundColor = UIColor.createColor(lightMode: UIColor(named: "background")!, darkMode: UIColor(named: "background")!)
        contentView.addSubview(postAuthor)
        contentView.addSubview(postImageView)
        contentView.addSubview(postDescription)
        contentView.addSubview(postLikes)
        contentView.addSubview(postViews)
        
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
