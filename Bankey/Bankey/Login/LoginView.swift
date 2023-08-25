//
//  LoginView.swift
//  Bankey
//
//  Created by Darpan Choudhary on 24/08/23.
//

import Foundation
import UIKit


class LoginView: UIView{
    let stackView = UIStackView()
    
    let usernameTF = UITextField()
    let passwordTF = UITextField()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView{
    
    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        usernameTF.translatesAutoresizingMaskIntoConstraints = false
        usernameTF.placeholder = "Username"
        usernameTF.delegate = self
        
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.placeholder = "Password"
        passwordTF.isSecureTextEntry = true
        passwordTF.delegate = self
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    func layout(){
        stackView.addArrangedSubview(usernameTF)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTF)
        
        
        addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
        ])
        
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}


extension LoginView: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTF.endEditing(true)
        passwordTF.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
}
