//
//  registerVC.swift
//  MathBusterSNP
//
//  Created by yunus on 11.11.2024.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController{
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    let emailPlaceholderView = UIImageView()
    let passwordPlaceholderView = UIImageView()
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    
    let regButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        setupUI()
    }
    
    @objc func regButtonPressed(){
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error{
                    print(error.localizedDescription)
                } else {
                    self.navigationController?.pushViewController(ViewController(), animated: true)
                }
            }
        }
    }
}

extension RegisterViewController {
    func setupUI() {
        emailPlaceholderView.translatesAutoresizingMaskIntoConstraints = false
        passwordPlaceholderView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        regButton.translatesAutoresizingMaskIntoConstraints = false
        
        emailPlaceholderView.image = UIImage(named: "textField")
        emailPlaceholderView.contentMode = .scaleAspectFit
        view.addSubview(emailPlaceholderView)
        
        passwordPlaceholderView.image = UIImage(named: "textField")
        passwordPlaceholderView.contentMode = .scaleAspectFit
        view.addSubview(passwordPlaceholderView)
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        emailTextField.textColor = .black
        view.addSubview(emailTextField)
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textColor = .black
        view.addSubview(passwordTextField)
        
        regButton.setTitle("Register", for: .normal)
        regButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        regButton.backgroundColor = .systemMint
        regButton.addTarget(self, action: #selector(regButtonPressed), for: .touchUpInside)
        regButton.layer.cornerRadius = 15
        view.addSubview(regButton)
        
        
        
        
        NSLayoutConstraint.activate([
            //placeholderView
            emailPlaceholderView.widthAnchor.constraint(equalToConstant: 300),
            emailPlaceholderView.heightAnchor.constraint(equalToConstant: 90),
            emailPlaceholderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailPlaceholderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            passwordPlaceholderView.widthAnchor.constraint(equalToConstant: 300),
            passwordPlaceholderView.heightAnchor.constraint(equalToConstant: 90),
            passwordPlaceholderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordPlaceholderView.topAnchor.constraint(equalTo: emailPlaceholderView.bottomAnchor),
            //emailTextField
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: emailPlaceholderView.topAnchor, constant: 7),
            emailTextField.widthAnchor.constraint(equalToConstant: 210),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            // passwordTextField
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: passwordPlaceholderView.topAnchor, constant: 7),
            passwordTextField.widthAnchor.constraint(equalToConstant: 210),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            //loginButton
            regButton.widthAnchor.constraint(equalToConstant: 200),
            regButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            regButton.topAnchor.constraint(equalTo: passwordPlaceholderView.bottomAnchor, constant: 60)
        ])
        
    }
}

