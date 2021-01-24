//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Sergey on 30.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

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
        
        photosLable.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
        }
        
        firstPic.snp.makeConstraints { make in
            make.height.equalTo(firstPic.snp.width)
        }
        
        gallery.snp.makeConstraints { make in
            make.top.equalTo(photosLable.snp.bottom).offset(12)
            make.bottom.equalToSuperview().inset(12)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().inset(12)
        }
        arrowSign.snp.makeConstraints { make in
            make.centerY.equalTo(photosLable.snp.centerY)
            make.width.height.equalTo(25)
            make.trailing.equalToSuperview().inset(12)
        }
    }
}
