//
//  ForgotPassController.swift
//  TravelLog
//
//  Created by Nikoloz Gachechiladze on 18.03.24.
//

import UIKit

class ForgotPassController: UIViewController {
    
    private let headerView = AuthHeaderView(title: "Forgot Password", subTitle: "Reset your Password.")
    private let emailField = CustomTextField(fieldType: .email)
    private let forgotButton = CustomButton(title: "Reset Password", hasBackground: true, fontSize: .big)
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupConstraints()
        setupCustomSpacing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setupUI() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(headerView)
        mainStackView.addArrangedSubview(emailField)
        mainStackView.addArrangedSubview(forgotButton)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        forgotButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 200),
            emailField.heightAnchor.constraint(equalToConstant: 54),
            forgotButton.heightAnchor.constraint(equalToConstant: 54),
        ])
    }
    
    private func setupCustomSpacing() {
        mainStackView.setCustomSpacing(30, after: headerView)
        mainStackView.setCustomSpacing(12, after: emailField)
    }

}
