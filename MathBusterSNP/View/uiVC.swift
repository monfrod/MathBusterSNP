//
//  uiVC.swift
//  MathBusterSNP
//
//  Created by yunus on 06.11.2024.
//

import UIKit

extension ViewController {
    func setupUI(){
        title = "Math Buster"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log out", style: .done, target: self, action: #selector(logOutActivate))
        
        
        
        //namelabel
        nameLabel.text = "Math Buster"
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 50)
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(70)
        }
        
        //scoreLabel
        scoreLabel.text = "Score: \(score)"
        scoreLabel.textColor = .white
        scoreLabel.textAlignment = .center
        scoreLabel.font.withSize(20)
        scoreLabel.snp.makeConstraints { make in
            make.width.equalTo(100)
        }
        
        //taskLabel
        taskLabel.text = ""
        taskLabel.textColor = .lightGray
        taskLabel.font = UIFont.boldSystemFont(ofSize: 30)
        taskLabel.textAlignment = .center
        taskLabel.textColor = .white
        
        
        //timerLabel
        timerLabel.text = "00:\(timerInt)"
        timerLabel.font.withSize(30)
        timerLabel.textColor = .black
        
        //textField
        textField.placeholder = "result"
        textField.textColor = .darkGray
        textField.keyboardType = .decimalPad
        textField.backgroundColor = .white
        textField.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(35)
        }
        
        //submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.titleLabel?.font.withSize(20)
        submitButton.layer.cornerRadius = 10
        submitButton.backgroundColor = .systemBlue
        submitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        submitButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(300)
        }
        
        //startButton
        startButton.setTitle("Start", for: .normal)
        startButton.titleLabel?.font.withSize(20)
        startButton.layer.cornerRadius = 10
        startButton.backgroundColor = .systemBlue
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        startButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(300)
        }
        
        
        // segmentedController
        segmentedControl.insertSegment(withTitle: "Easy", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Medium", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "Hard", at: 2, animated: true)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            segmentedControl.widthAnchor.constraint(equalToConstant: 300),
            segmentedControl.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        //ProgressView
        progressView.progressTintColor = .systemIndigo
        progressView.progress = 1
        
        
        timerView.addSubview(timerLabel)
        timerView.addSubview(progressView)
        timerView.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(70)
        }
        timerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(timerView.snp.top).offset(20)
        }
        progressView.snp.makeConstraints { make in
            make.height.equalTo(3)
            make.width.equalTo(300)
            make.bottom.equalTo(timerView.snp.bottom).offset(-5)
        }
        
        recordLabel.text = "Your best score: 0"
        recordLabel.textColor = .white
        recordLabel.textAlignment = .center
        recordLabel.font.withSize(25)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    
        
        
        VStack.addArrangedSubview(nameLabel)
        VStack.addArrangedSubview(recordLabel)
        VStack.addArrangedSubview(scoreLabel)
        VStack.addArrangedSubview(taskLabel)
        VStack.addArrangedSubview(segmentedControl)
        VStack.addArrangedSubview(timerView)
        VStack.addArrangedSubview(textField)
        VStack.addArrangedSubview(submitButton)
        VStack.addArrangedSubview(startButton)
        view.addSubview(VStack)
        VStack.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(500)
            make.top.equalTo(view.snp.top).offset(100)
            make.centerX.equalToSuperview()
        }
    }
}
