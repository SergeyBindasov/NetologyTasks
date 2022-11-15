//
//  RegisterViewController.swift
//  Navigation
//
//  Created by Sergey on 26.01.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit
import Firebase
import RealmSwift

class RegisterViewController: UIViewController {
    
    weak var coordinator: ProfileFlowCoordinator?
    
    let realm = try! Realm()
    
    var userIdentification: Results<AuthorizationModel>?
    
    private lazy var registerView: UIView = {
        let registerView = UIView()
        registerView.backgroundColor = UIColor.createColor(lightMode: UIColor(named: "background")!, darkMode: UIColor(named: "background")!)
        return registerView
    }()
    
    private lazy var logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "vkfulllogo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public lazy var loginTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.backgroundColor = UIColor.createColor(lightMode: UIColor(named: "textField")!, darkMode: UIColor(named: "textField")!)
        textField.textColor = UIColor.createColor(lightMode: UIColor(named: "text")!, darkMode: UIColor(named: "text")!)
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.tintColor = #colorLiteral(red: 0.2989781797, green: 0.5310710073, blue: 0.7931908965, alpha: 1)
        textField.autocapitalizationType = .none
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(enterLogin(_ :)), for: .editingChanged)
        return textField
    }()
    
    private lazy var passwordTF: UITextField = {
        let secondTextField = UITextField()
        secondTextField.placeholder = "Password"
        secondTextField.layer.borderColor = UIColor.lightGray.cgColor
        secondTextField.layer.borderWidth = 0.5
        secondTextField.layer.cornerRadius = 10
        secondTextField.backgroundColor = UIColor.createColor(lightMode: UIColor(named: "textField")!, darkMode: UIColor(named: "textField")!)
        secondTextField.textColor = UIColor.createColor(lightMode: UIColor(named: "text")!, darkMode: UIColor(named: "text")!)
        secondTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        secondTextField.isSecureTextEntry = false
        secondTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: secondTextField.frame.height))
        secondTextField.leftViewMode = .always
        secondTextField.addTarget(self, action: #selector(enterPassword(_ :)), for: .editingChanged)
        return secondTextField
    }()
    
    private lazy var stackViewTF: UIStackView = {
        let newView = UIStackView(arrangedSubviews: [loginTF, passwordTF])
        newView.axis = NSLayoutConstraint.Axis.vertical
        newView.distribution = UIStackView.Distribution.fillProportionally
        newView.alignment = .fill
        newView.spacing = 00
        return newView
    }()
    
    private lazy var registerButton: CustomButton = {
        let button = CustomButton(onTap: self.registerAction)
        button.setTitle("Зарегистрировать", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2989781797, green: 0.5310710073, blue: 0.7931908965, alpha: 1)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }
}

extension RegisterViewController {
    func setupLayout() {
        view.addSubviews(registerView)
        registerView.addSubviews(logo, stackViewTF, registerButton)
        
        registerView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        logo.snp.makeConstraints { make in
            make.leading.equalTo(registerView).offset(16)
            make.trailing.equalTo(registerView).offset(-16)
            make.center.equalTo(registerView.snp.center)
            make.height.lessThanOrEqualTo(60)
        }
                
        stackViewTF.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(48)
            make.leading.equalTo(registerView).offset(16)
            make.trailing.equalTo(registerView).offset(-16)
            make.height.equalTo(100)
        }
        
        registerButton.snp.makeConstraints { make in
            make.leading.equalTo(registerView).offset(16)
            make.trailing.equalTo(registerView).offset(-16)
            make.bottom.equalTo(registerView.snp.bottom).offset(-135)
            make.height.equalTo(50)
        }
    }
    
    func registerAction () {
        if let email = loginTF.text, let password = passwordTF.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let errorExists = error {
                    let alert = UIAlertController(title: "Что-то пошло не так", message: errorExists.localizedDescription, preferredStyle: .alert)
                    let action = UIAlertAction(title: "Понятно", style: .cancel) { action in
                        self.loginTF.text = ""
                        self.passwordTF.text = ""
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    let newUser = AuthorizationModel()
                    newUser.userLogin = email
                    newUser.userPassword = password
                    newUser.isCreated = true
                    self.saveUserId(model: newUser)
                    let alert = UIAlertController(title: "Поздравляем!", message: "Регистрация прошла успешно", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ок", style: .cancel) { action in
                        self.dismiss(animated: true, completion: nil)
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    @objc private func enterLogin(_ textField: UITextField) {
       
    }
    
    @objc private func enterPassword(_ textField: UITextField) {
        //Стимулятор выдает предупрежение  - [AutoFill] Cannot show Automatic Strong Passwords for app bundleID: due to error: iCloud Keychain is disabled. Поэтому скрытй пароль отключил.
        //passwordTF.isSecureTextEntry = true
        
    }
    
    func saveUserId(model: AuthorizationModel) {
        do {
            try realm.write({
                realm.add(model)
            })
        } catch {
            print ("произошла ошибка сохраняя пользовательские данные \(error.localizedDescription)")
        }
    }
}
