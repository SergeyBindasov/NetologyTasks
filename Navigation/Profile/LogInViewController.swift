//
//  LogInViewController.swift
//  Navigation
//
//  Created by Sergey on 14.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    var delegate: LoginViewControllerDelegate?
    
    weak var coordinator: ProfileFlowCoordinator?
    
    private lazy var loginView: UIView = {
        let loginView = UIView()
        loginView.backgroundColor = .white
        return loginView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self
        scrollView.backgroundColor = .white
        return scrollView
        
    }()
    
    private lazy var vkLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "vklogo")
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    
    private lazy var loginButton: CustomButton = {
        let button = CustomButton(onTap: self.loginAction
        , setTitle: "Login", titleColor: .white)
        button.setTitle("Login", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(1.0), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .selected)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .highlighted)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .disabled)
        return button
    }()
    
    public lazy var loginTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or phone"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
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
        secondTextField.backgroundColor = .systemGray6
        secondTextField.textColor = .black
        secondTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        secondTextField.isSecureTextEntry = true
        secondTextField.autocapitalizationType = .none
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
    
    private lazy var lineLabel: UILabel = {
        let label = UILabel()
        label.text = "Все еще нет аккаунта?"
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.text = "Зарегистрируйся!"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = #colorLiteral(red: 0.2989781797, green: 0.5310710073, blue: 0.7931908965, alpha: 1)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(registerTapped))
        registerLabel.addGestureRecognizer(tap)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc private func registerTapped(sender:UITapGestureRecognizer) {
        registerLabel.textColor = .opaqueSeparator
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.registerLabel.textColor = #colorLiteral(red: 0.2989781797, green: 0.5310710073, blue: 0.7931908965, alpha: 1)
   }
        print("РАБОТАЕТ!!")
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    func loginAction () {
        
        let userService: UserService
        guard let loginText = loginTF.text else { return }
        guard let passwordText = passwordTF.text else { return }
        
        #if DEBUG
        userService = TestUserService()
        #else
        userService = CurrentUserService()
        #endif
        if delegate?.shouldLoginPasswordChecked(login: loginText, password: passwordText) == true {
            coordinator?.loginAction(userService: userService, userName: loginText)
        } else {
            print("incorrect login or password")
        }
    }
    
    @objc private func enterLogin(_ textField: UITextField) {
    }
    
    @objc private func enterPassword(_ textField: UITextField) {
    }
    
    
    
    // MARK: setupLayout
    
    private func setupLayout() {
        view.addSubviews(scrollView)
        scrollView.addSubviews(loginView)
        loginView.addSubviews(vkLogo, loginButton, lineLabel, stackViewTF, registerLabel)

        
        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            loginView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            loginView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            vkLogo.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 120),
            vkLogo.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            vkLogo.heightAnchor.constraint(equalToConstant: 100),
            vkLogo.widthAnchor.constraint(equalToConstant: 100),
            stackViewTF.heightAnchor.constraint(equalToConstant: 100),
            stackViewTF.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            stackViewTF.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -16),
            stackViewTF.topAnchor.constraint(equalTo: vkLogo.bottomAnchor, constant: 120),
            loginTF.heightAnchor.constraint(equalToConstant: 50),
            passwordTF.heightAnchor.constraint(equalToConstant: 50),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.topAnchor.constraint(equalTo: stackViewTF.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -16),
            loginButton.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -135),
            lineLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            //lineLabel.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -180)
            lineLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 36),
            registerLabel.leadingAnchor.constraint(equalTo: lineLabel.trailingAnchor, constant: 4),
            registerLabel.centerYAnchor.constraint(equalTo: lineLabel.centerYAnchor),
            registerLabel.trailingAnchor.constraint(lessThanOrEqualTo: loginView.trailingAnchor, constant: -16)
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

extension LogInViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
}

