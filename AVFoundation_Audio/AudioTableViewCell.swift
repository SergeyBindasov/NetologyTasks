//
//  AudioTableViewCell.swift
//  AVFoundation_Audio
//
//  Created by Sergey on 11.03.2021.
//

import UIKit

class AudioTableViewCell: UITableViewCell {
    
    var content: MusicStruct? {
        didSet {
            guard let content = content else { return }
            songTitle.text = content.songTitle
            coverImage.image = content.cover
        }
    }
    
    private lazy var songTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "DamascusLight ", size: 16)
        title.numberOfLines = 0
        title.textColor = .darkGray
        return title
    }()
    
    private lazy var coverImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

private extension AudioTableViewCell {
    func setupLayout() {
        contentView.addSubviews(songTitle, coverImage)
        
        let constraints = [
            songTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            songTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            songTitle.heightAnchor.constraint(equalToConstant: 30),
            coverImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            coverImage.heightAnchor.constraint(equalToConstant: 50),
            coverImage.widthAnchor.constraint(equalToConstant: 50),
            coverImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            songTitle.trailingAnchor.constraint(equalTo: coverImage.leadingAnchor, constant: 18)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
