//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Sergey on 28.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

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
        
        postAuthor.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        postImageView.snp.makeConstraints { make in
            make.height.width.equalTo(contentView.snp.width)
            make.top.equalTo(postAuthor.snp.bottom).offset(12)
        }
        
        postDescription.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(10)
        }
        
        postLikes.snp.makeConstraints { make in
            make.top.equalTo(postDescription.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        postViews.snp.makeConstraints {make in
            make.top.equalTo(postDescription.snp.bottom).offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(contentView.snp_bottomMargin).inset(10)
        }
    }
}
