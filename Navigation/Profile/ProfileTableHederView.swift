//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Sergey on 28.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

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
        
        avatarImageView.snp.makeConstraints { make in
            make.height.width.equalTo(150)
            make.top.leading.equalToSuperview().offset(16)
        }
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(27)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(10)
        }
        status.snp.makeConstraints { make in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(25)
            make.top.equalToSuperview().offset(94)
            make.trailing.equalToSuperview().inset(16)
        }
        
        setStatusTextField.snp.makeConstraints { make in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(25)
            make.top.equalTo(status.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        button.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.bottom.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(avatarImageView.snp.bottom).offset(16)
        }
    }
}
