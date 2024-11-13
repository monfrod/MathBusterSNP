//
//  loginVC.swift
//  MathBusterSNP
//
//  Created by yunus on 11.11.2024.
//
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
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
    
    let logInButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
        setupUI()
    }
    
    @objc func logButtonPressed(){
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let error {
                    print(error.localizedDescription)
                }else{
                    self.navigationController?.pushViewController(TabBarController(), animated: true)
                }
                
            }
        }
    }
}


extension LoginViewController {
    func setupUI() {
        emailPlaceholderView.translatesAutoresizingMaskIntoConstraints = false
        passwordPlaceholderView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        emailPlaceholderView.image = UIImage(named: "textField")
        emailPlaceholderView.contentMode = .scaleAspectFit
        view.addSubview(emailPlaceholderView)
        
        passwordPlaceholderView.image = UIImage(named: "textField")
        passwordPlaceholderView.contentMode = .scaleAspectFit
        view.addSubview(passwordPlaceholderView)
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        emailTextField.text = "yunus@kbtu.kz"
        emailTextField.textColor = .black
        view.addSubview(emailTextField)
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordTextField.isSecureTextEntry = true
        passwordTextField.text = "asasin"
        passwordTextField.textColor = .black
        view.addSubview(passwordTextField)
        
        logInButton.setTitle("Log In", for: .normal)
        logInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        logInButton.backgroundColor = .systemIndigo
        logInButton.addTarget(self, action: #selector(logButtonPressed), for: .touchUpInside)
        logInButton.layer.cornerRadius = 15
        view.addSubview(logInButton)
        
        
        
        
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
            logInButton.widthAnchor.constraint(equalToConstant: 200),
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.topAnchor.constraint(equalTo: passwordPlaceholderView.bottomAnchor, constant: 60)
        ])
        
    }
}
