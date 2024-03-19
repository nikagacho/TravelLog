 //
//  LoginController.swift
//  TravelLog
//
//  Created by Nikoloz Gachechiladze on 15.03.24.
//

import UIKit

class LoginController: UIViewController {
    
    //MARK: - UI Elements
    
    private let headerView = AuthHeaderView(title: "Sign In", subTitle: "Sign In to your account")
    private let emailField = CustomTextField(fieldType: .email )
    private let passwordField = CustomTextField(fieldType: .password)
    private let loginButton = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
    private let newUserButton = CustomButton(title: "Don't have an account? Create now.", fontSize: .medium)
    private let forgotPassButton = CustomButton(title: "Forgot your Password?", fontSize: .small)
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 12
        return stackView
    }()

    //MARK: LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupCustomSpacing()
        setupButtons()
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: Setup UI, Buttons, Constraints
    
    private func setupButtons() {
        self.loginButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        self.newUserButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        self.forgotPassButton.addTarget(self, action: #selector(didTapForgotPass), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(headerView)
        mainStackView.addArrangedSubview(emailField)
        mainStackView.addArrangedSubview(passwordField)
        mainStackView.addArrangedSubview(loginButton)
        mainStackView.addArrangedSubview(newUserButton)
        mainStackView.addArrangedSubview(forgotPassButton)
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPassButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor),
            mainStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 250),
            emailField.heightAnchor.constraint(equalToConstant: 54),
            passwordField.heightAnchor.constraint(equalToConstant: 54),
            loginButton.heightAnchor.constraint(equalToConstant: 54),
            newUserButton.heightAnchor.constraint(equalToConstant: 44),
            forgotPassButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupCustomSpacing() {
        mainStackView.setCustomSpacing(30, after: headerView)
    }
    
    //MARK: - Setup Selectors
    
    @objc func didTapSignIn() {
        print("didTapSignUp")
    }
    
    @objc func didTapSignUp() {
        let vc = RegisterController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapForgotPass() {
        let vc = ForgotPassController()
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

