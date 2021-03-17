//
//  DetailsTableViewCell.swift
//  MyHabits
//
//  Created by Sergey on 24.11.2020.
//  Copyright © 2020 Sergey. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    
    public lazy var dateLabel: UILabel = {
        let date = UILabel()
        return date
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(dateLabel)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DetailsTableViewCell {
    func setupLayout(){
        let constraints = [
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -12),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
