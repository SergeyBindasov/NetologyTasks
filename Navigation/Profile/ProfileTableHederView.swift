//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Sergey on 28.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileTableHederView: UIView {
    
    private lazy var avatarImageView: UIImageView = {
        let picture = UIImageView()
        picture.image = UIImage(named: "20")
        picture.layer.borderWidth = 3
        picture.layer.borderColor = UIColor.white.cgColor
        picture.layer.cornerRadius = 75
        picture.clipsToBounds = true
        picture.contentMode = .scaleAspectFit
        return picture
    }()
    
    private lazy var title: UILabel = {
        let lable = UILabel()
        lable.text = "Name Name"
        lable.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lable.textColor = .black
        lable.textAlignment = .center
        return lable
    }()
    
    private lazy var status: UILabel = {
        let text = UILabel()
        text.text = "Thinking about smth..."
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.textColor = .gray
        text.textAlignment = .center
        return text
    }()
    
    private lazy var setStatusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Set a new status"
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 12
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(setStatus(_ :)), for: .editingChanged)
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 10
        button.layer.backgroundColor = UIColor.systemBlue.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    } ()
    
    override init(frame: CGRect) {
          super.init(frame: frame)
        
        if #available(iOS 13.0, *) {
            backgroundColor = .systemGray6
        } else {
            // Fallback on earlier versions
        }
        addSubviews(avatarImageView, title, status, setStatusTextField, button)
        setupHeader()
      }
      
      required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }
    
    @objc private func setStatus(_ textField: UITextField) {
        status.text = textField.text
    }
    
    @objc private func buttonPressed() {
    setStatusTextField.text = status.text ?? "Нет статуса"
    }
    
    private func setupHeader() {
        
        let constraints = [
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            title.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            status.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 25),
            status.topAnchor.constraint(equalTo: topAnchor, constant: 94),
            status.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 25),
            setStatusTextField.topAnchor.constraint(equalTo: status.bottomAnchor, constant: 10),
            setStatusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusTextField.heightAnchor.constraint(equalToConstant: 40),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
