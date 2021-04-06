//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Sergey on 30.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    
    private lazy var photosLable: UILabel = {
        let lable = UILabel()
        lable.text = "Photos"
        lable.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        lable.textColor = .black
        return lable
    }()
    
    private lazy var firstPic: UIImageView = {
        let pic = UIImageView()
        pic.image = UIImage(named: "01")
        pic.layer.cornerRadius = 6
        pic.clipsToBounds = true
        pic.toAutoLayuot()
        return pic
    }()
    
    private lazy var secondPic: UIImageView = {
        let pic = UIImageView()
        pic.image = UIImage(named: "02")
        pic.layer.cornerRadius = 6
        pic.clipsToBounds = true
        pic.toAutoLayuot()
        return pic
    }()
    
    private lazy var thirdPic: UIImageView = {
        let pic = UIImageView()
        pic.image = UIImage(named: "03")
        pic.layer.cornerRadius = 6
        pic.clipsToBounds = true
        pic.toAutoLayuot()
        return pic
    }()
    
    private lazy var fourthPic: UIImageView = {
        let pic = UIImageView()
        pic.image = UIImage(named: "04")
        pic.layer.cornerRadius = 6
        pic.clipsToBounds = true
        pic.toAutoLayuot()
        return pic
    }()
    
    private lazy var gallery: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()

    private lazy var arrowSign: UIImageView = {
        let arrow = UIImageView()
        arrow.image = UIImage(named: "rightArrow")
        return arrow
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: .default, reuseIdentifier: reuseIdentifier)
           setupLayout()
       }
       
       required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
       }
    
}

private extension PhotosTableViewCell {
    func setupLayout() {
        contentView.addSubviews(photosLable, arrowSign, gallery)
        
        gallery.addArrangedSubview(firstPic)
        gallery.addArrangedSubview(secondPic)
        gallery.addArrangedSubview(thirdPic)
        gallery.addArrangedSubview(fourthPic)
        
        
        let constraints = [
            photosLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            firstPic.heightAnchor.constraint(equalTo: firstPic.widthAnchor),
            gallery.topAnchor.constraint(equalTo: photosLable.bottomAnchor, constant: 12),
            gallery.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            gallery.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            gallery.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            arrowSign.centerYAnchor.constraint(equalTo: photosLable.centerYAnchor),
            arrowSign.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrowSign.heightAnchor.constraint(equalTo: firstPic.heightAnchor, multiplier: 0.25),
            arrowSign.widthAnchor.constraint(equalTo: arrowSign.heightAnchor),
            arrowSign.bottomAnchor.constraint(equalTo: gallery.topAnchor, constant: -12),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
