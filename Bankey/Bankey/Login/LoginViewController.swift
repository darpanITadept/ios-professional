//
//  ViewController.swift
//  Bankey
//
//  Created by Darpan Choudhary on 24/08/23.
//

import Foundation
import UIKit

protocol LogoutDelegate: AnyObject {
    func didLogout()
}

protocol LoginViewControllerDelegate: AnyObject{
    func didLogin()
}

class LoginViewController: UIViewController {

    let headingLbl = UILabel()
    let sloganLbl = UILabel()
    
    let loginView = LoginView()
    
    let signInButton = UIButton(type: .system)
    
    let errorMessageLbl = UILabel()
 
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String? {
        return loginView.usernameTF.text
    }
    
    var password: String? {
        return loginView.passwordTF.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
}

extension LoginViewController{
    private func style(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for indicator spacing
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        
        errorMessageLbl.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLbl.textAlignment = .center
        errorMessageLbl.textColor = .systemRed
        errorMessageLbl.numberOfLines = 0
        errorMessageLbl.text = "Username/password cannot be blank"
        errorMessageLbl.isHidden = true
        
        headingLbl.translatesAutoresizingMaskIntoConstraints = false
        headingLbl.textAlignment = .center
        headingLbl.text = "Bankey"
        headingLbl.font = UIFont.systemFont(ofSize: 30)
        
        sloganLbl.translatesAutoresizingMaskIntoConstraints = false
        sloganLbl.textAlignment = .center
        sloganLbl.numberOfLines = 2
        sloganLbl.text = "Your premium source for all\nthings banking!"
//        sloganLbl.font = UIFont.systemFont(ofSize: 30)
        
    }
    
    private func layout(){
        view.addSubview(headingLbl)
        view.addSubview(sloganLbl)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLbl)
        
        // Heading Label
        NSLayoutConstraint.activate([
            headingLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            headingLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headingLbl.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: headingLbl.leadingAnchor, multiplier: 1),
        ])
        
        // Slogan Label
        NSLayoutConstraint.activate([
            sloganLbl.topAnchor.constraint(equalToSystemSpacingBelow: headingLbl.bottomAnchor, multiplier: 2),
            sloganLbl.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: sloganLbl.trailingAnchor, multiplier: 1)
        ])
        
        // LoginView
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: sloganLbl.bottomAnchor, multiplier: 2),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 1),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1)
        ])
        
        // ErrorLabel
        NSLayoutConstraint.activate([
            errorMessageLbl.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLbl.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorMessageLbl.trailingAnchor, multiplier: 2)
        ])
        
       
    }
}

//MARK: Action
extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLbl.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else{
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password should never be nil")
            return
        }
        
        if username == "Kevin" && password == "Welcome"{
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        }
        else{
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String){
        errorMessageLbl.isHidden = false
        errorMessageLbl.text = message
    }
    
}

