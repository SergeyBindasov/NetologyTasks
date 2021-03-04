//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Sergey on 01.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var gallery: Pic? {
        didSet {
            guard let gallery = gallery else {
                return }
            picture.image = gallery.image
        }
        
    }
    lazy var picture: UIImageView = {
        let picture = UIImageView()
        return picture
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PhotosCollectionViewCell {
    func setupLayout() {
        contentView.addSubviewWithAutoLayout(picture)

        
        let constraints = [
            picture.topAnchor.constraint(equalTo: contentView.topAnchor),
            picture.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            picture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            picture.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
}
