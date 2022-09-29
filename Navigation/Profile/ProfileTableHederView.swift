//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Sergey on 28.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileTableHederView: UIView {
    
    public lazy var avatarImageView: UIImageView = {
        let picture = UIImageView()
        picture.image = UIImage(named: "cat")
        picture.layer.borderWidth = 3
        picture.layer.borderColor = UIColor.white.cgColor
        picture.layer.cornerRadius = 75
        picture.clipsToBounds = true
        picture.contentMode = .scaleAspectFit
        picture.toAutoLayuot()

        return picture
    }()
    
    public lazy var title: UILabel = {
        let lable = UILabel()
        lable.text = "Dusty The Cat"
        lable.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lable.textColor = .black
        lable.textAlignment = .center
        lable.numberOfLines = 0
        lable.toAutoLayuot()
        return lable
    }()
    
    public lazy var status: UILabel = {
        let text = UILabel()
        text.text = "Thinking about smth...".localized
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.textColor = .gray
        text.textAlignment = .center
        text.toAutoLayuot()
        return text
    }()
    
    private lazy var setStatusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Set a new status".localized
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 12
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(setStatus(_ :)), for: .editingChanged)
        textField.toAutoLayuot()
        return textField
    }()
    
    private lazy var button: CustomButton = {
        let button = CustomButton(onTap: self.buttonPressed)
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 10
        button.layer.backgroundColor = UIColor.systemBlue.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.setTitle("Set status".localized, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.toAutoLayuot()
        return button
    } ()
    
    override init(frame: CGRect) {
          super.init(frame: frame)
        
        backgroundColor = .systemGray6
        addSubview(avatarImageView)
        addSubview(title)
        addSubview(status)
        addSubview(setStatusTextField)
        addSubview(button)
        setupHeader()
      }
      
      required init?(coder: NSCoder) {
          super.init(coder: coder)
      }
    
    @objc private func setStatus(_ textField: UITextField) {
        status.text = textField.text
        
    }
    
    func buttonPressed() {
    setStatusTextField.text = status.text ?? "No status"
        button.backgroundColor = .orange
        setStatusTextField.resignFirstResponder()
        
        
     
    }
    
    private func setupHeader() {
        
        let constraints = [
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            title.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
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

