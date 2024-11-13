//
//  mainVC.swift
//  MathBusterSNP
//
//  Created by yunus on 11.11.2024.
//
import UIKit

class MainViewController: UIViewController {
    
    let mathLabel: UILabel = {
        let label = UILabel()
        label.text = "Math"
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label.textAlignment = .center
        label.textColor = .systemMint
        return label
    }()
    
    let busterLabel: UILabel = {
        let label = UILabel()
        label.text = "Buster"
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label.textAlignment = .center
        label.textColor = .systemIndigo
        return label
    }()
    
    let nameHstack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let regButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 15
        return button
    }()
    
    let logButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 15
        return button
    }()
    
    let hstack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .color
        nameHstack.addArrangedSubview(mathLabel)
        nameHstack.addArrangedSubview(busterLabel)
        
        hstack.addArrangedSubview(regButton)
        hstack.addArrangedSubview(logButton)
        view.addSubview(hstack)
        view.addSubview(nameHstack)
        regButton.translatesAutoresizingMaskIntoConstraints = false
        logButton.translatesAutoresizingMaskIntoConstraints = false
        
        regButton.addTarget(self, action: #selector(regButtonTapped), for: .touchUpInside)
        logButton.addTarget(self, action: #selector(logButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            nameHstack.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            nameHstack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hstack.widthAnchor.constraint(equalToConstant: 350),
            hstack.heightAnchor.constraint(equalToConstant: 50),
            hstack.topAnchor.constraint(equalTo: nameHstack.bottomAnchor, constant: 300),
            hstack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]) 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationItem.hidesBackButton = true
    }
    @objc func logButtonTapped(){
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    @objc func regButtonTapped(){
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
}
