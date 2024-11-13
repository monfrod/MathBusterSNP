//
//  ViewController.swift
//  MathBusterSNP
//
//  Created by yunus on 29.10.2024.
//

import UIKit
import SnapKit
import AVFoundation
import FirebaseFirestore
import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    let db = Firestore.firestore()
    
    let segmentedControl = UISegmentedControl()
    let nameLabel = UILabel()
    var scoreLabel = UILabel()
    let taskLabel = UILabel()
    let timerLabel = UILabel()
    let submitButton = UIButton()
    var timerInt: Int = 30
    let textField = UITextField()
    let startButton = UIButton()
    let fisrt: Int = 0
    let second: Int = 0
    var timer: Timer?
    let progressView = UIProgressView()
    var player: AVAudioPlayer?
    var recordLabel = UILabel()
    
    
    var firstDigit: Int = 0
    var secondDigit: Int = 0
    var score: Int = 0
    var correctAnswer: Float = 0.0
    
    let operArray = ["+", "-", "*", "/"]
    var oper: Int = 0
    
    let currentUser = Auth.auth().currentUser!
    
    
    let VStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = 15
        return stack
    }()
    
    let timerView: UIView = {
        let view = UIView()
        view.backgroundColor = .color
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await Storage().fetchData()
        }
        view.backgroundColor = .systemIndigo
        textField.delegate = self
        submitButton.isEnabled = false
        segmentedControl.selectedSegmentIndex = 0
        navigationItem.hidesBackButton = true
        print(currentUser.email!)
        setupUI()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationItem.hidesBackButton = true
        tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log out", style: .done, target: self, action: #selector(logOutActivate))
    }
    
    @objc func startButtonPressed(){
        submitButton.isEnabled = true
        timer?.invalidate()
        timerInt = 30
        score = 0
        progressView.progressTintColor = .systemIndigo
        scoreLabel.text = "Score: \(score)"
        generateTask()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerStart), userInfo: nil, repeats: true)
        timerLabel.text = "00:\(timerInt)"
    }
    
    @objc func submitButtonPressed(){
        let userAnswer = Float(textField.text?.replacingOccurrences(of: ",", with: ".") ?? "0")
        if userAnswer == correctAnswer {
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                score += 1
            case 1:
                score += 2
            case 2:
                score += 3
            default:
                print("error1")
            }
            playSound(name: "correct-6033", type: "mp3")
        } else{
            playSound(name: "wronganswer-37702", type: "mp3")
        }
        scoreLabel.text = "Score: \(score)"
        textField.text = ""
        
        if score >= 10{
            segmentedControl.selectedSegmentIndex = 1
        } else if score >= 20{
            segmentedControl.selectedSegmentIndex = 2
        }
        
        generateTask()
        
    }
    
    func generateTask(){
        let segInt = segmentedControl.selectedSegmentIndex
        switch segInt {
        case 0:
            firstDigit = Int.random(in: 1..<10)
            secondDigit = Int.random(in: 1..<10)
        case 1:
            firstDigit = Int.random(in: 10..<100)
            secondDigit = Int.random(in: 10..<100)
        case 2:
            firstDigit = Int.random(in: 100..<1000)
            secondDigit = Int.random(in: 100..<1000)
        default:
            print("error2")
        }
        oper = Int.random(in: 0..<4)
        switch oper {
        case 0:
            correctAnswer = Float(firstDigit) + Float(secondDigit)
        case 1:
            if firstDigit < secondDigit{
                generateTask()
                return
            } else{
                correctAnswer = Float(firstDigit) - Float(secondDigit)
            }
        case 2:
            correctAnswer = Float(firstDigit) * Float(secondDigit)
        case 3:
            correctAnswer = Float(firstDigit) / Float(secondDigit)
        default:
            print("error3")
        }
        correctAnswer = (correctAnswer*10).rounded()/10
        print(correctAnswer)
        taskLabel.text = "\(firstDigit) \(operArray[oper]) \(secondDigit)"
        
        
    }
    
    @objc func dismissKeyboard() {
        textField.endEditing(true)
    }
    
    @objc func timerStart() {
        if timerInt == 0 {
            timer?.invalidate()
            
            
//            do {
//                let ref = try db.collection("users").addDocument(data: [
//                    "email": currentUser.email!,
//                    "score": score
//                ])
//                print("\(ref.documentID)")
//            } catch {
//                print("error")
//            }
            
            textField.isEnabled = false
            submitButton.isEnabled = false
            
            progressView.progressTintColor = .systemIndigo
            timerInt = 30
            
            let alert = UIAlertController(title: "Time's Up", message: "Your score: \(score)", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Try again", style: .default) { _ in
                self.textField.isEnabled = true
                self.submitButton.isEnabled = true
                self.startButtonPressed()
            }
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.dismiss(animated: true)
            }
            alert.addAction(okAction)
            alert.addAction(restartAction)
            score = 0
            
            present(alert, animated: true)
            timerLabel.text = "00:\(timerInt)"
        }
        if timerInt <= 10 {
            progressView.progressTintColor = .red
        }
    
        timerInt -= 1
        if timerInt < 10 {
            timerLabel.text = "00:0\(timerInt)"
        } else {
            timerLabel.text = "00:\(timerInt)"
        }
        
        progressView.progress = Float(timerInt)/30
        
    }
    
    
    func playSound(name: String, type: String) {
        let url = Bundle.main.url(forResource: name, withExtension: type)!

        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }

            player.prepareToPlay()
            player.play()

        } catch let error as NSError {
            print(error.description)
        }
    }
    
    @objc func logOutActivate(){
        do {
            try Auth.auth().signOut()
            navigationController?.pushViewController(MainViewController(), animated: false)
            print("sign out succesfully")
        } catch {
            print(error.localizedDescription)
        }
    }
}

