//
//  RegisterController.swift
//  TravelLog
//
//  Created by Nikoloz Gachechiladze on 18.03.24.
//

import UIKit

class RegisterController: UIViewController {
    
    //MARK: - UI Elements
    
    private let headerView = AuthHeaderView(title: "Sign Up", subTitle: "Sign up to create an account")
    private let emailField = CustomTextField(fieldType: .email)
    private let usernameField = CustomTextField(fieldType: .username)
    private let passwordField = CustomTextField(fieldType: .password)
    private let registerButton = CustomButton(title: "Sign Up", hasBackground: true, fontSize: .big)
    private let signInButton = CustomButton(title: "Already have an account? Sign In", fontSize: .medium)
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 12
        return stackView
    }()
    
    private let textView: UITextView = {
        let attributedString = NSMutableAttributedString(string: "By creating the account, you agree to our Terms & Conditions and you confirm that you have read our Privacy Policy")
        attributedString.addAttribute(.link, value: "terms://tAndC", range: (attributedString.string as NSString).range(of: "Terms & Conditions"))
        attributedString.addAttribute(.link, value: "privacy://pp", range: (attributedString.string as NSString).range(of: "Privacy Policy"))
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.attributedText = attributedString
        textView.linkTextAttributes = [.foregroundColor: UIColor.systemBlue]
        textView.textColor = .label
        textView.isEditable = false
        textView.isSelectable = true
        textView.delaysContentTouches = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        return textView
    }()

    //MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupCustomSpacing()
        setupButtons()
        view.backgroundColor = .systemBackground
        textView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Setup UI, Buttons, Constraints
    
    private func setupButtons() {
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        self.registerButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(headerView)
        mainStackView.addArrangedSubview(emailField)
        mainStackView.addArrangedSubview(usernameField)
        mainStackView.addArrangedSubview(passwordField)
        mainStackView.addArrangedSubview(registerButton)
        mainStackView.addArrangedSubview(signInButton)
        mainStackView.addArrangedSubview(textView)
        emailField.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor),
            mainStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 250),
            emailField.heightAnchor.constraint(equalToConstant: 54),
            usernameField.heightAnchor.constraint(equalToConstant: 54),
            passwordField.heightAnchor.constraint(equalToConstant: 54),
            registerButton.heightAnchor.constraint(equalToConstant: 54),
            signInButton.heightAnchor.constraint(equalToConstant: 36),
        ])
    }
    
    private func setupCustomSpacing() {
        mainStackView.setCustomSpacing(30, after: headerView)
        mainStackView.setCustomSpacing(8, after: signInButton)
    }
    
    //MARK: - Selectors
    
    @objc func didTapSignIn() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func didTapSignUp() {
        print("didTapSignUp")
    }

}

extension RegisterController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        if URL.scheme == "terms" {
            showWebView(with: "https://github.com/nikagacho/GeographyApp")
        } else if URL.scheme == "privacy" {
            showWebView(with: "https://adjarabet.com")
        }
        
        return true
    }
    
    private func showWebView(with urlString: String) {
        let vc = WebViewController(with: urlString)
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true )
    }
}
