//
//  CustomTextField.swift
//  TravelLog
//
//  Created by Nikoloz Gachechiladze on 18.03.24.
//

import UIKit

class CustomTextField: UITextField {

    enum CustomTextFieldType {
        case username
        case email
        case password
    }
    
    private let fieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType) {
        self.fieldType = fieldType
        super.init(frame: .zero)
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 12
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none 
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        switch fieldType {
        case .username:
            self.placeholder = "Username"
        case.email:
            self.placeholder = "E-Mail Address"
            self.keyboardType = .emailAddress
        case.password:
            self.placeholder = "Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
