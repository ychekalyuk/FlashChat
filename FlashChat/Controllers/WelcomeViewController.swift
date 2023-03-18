//
//  WelcomeViewController.swift
//  FlashChat
//
//  Created by Ildar Garifullin on 13/03/2023.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    //MARK: - let/var
    
    private let chatLabel: CLTypingLabel = {
        let label = CLTypingLabel()
        label.text = "⚡️FlashChat"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 50)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(registerButtonTaped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(logInButtonTaped), for: .touchUpInside)
        
        return button
    }()

    //MARK: - life cycle funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setConstraints()
        
//        chatLabel.text = ""
//        let chatLabel = "⚡️FlashChat"
//        var charIndex = 0
//        chatLabel.map { letter in
//            Timer.scheduledTimer(
//                withTimeInterval: 0.2 * Double(charIndex),
//                repeats: false) { timer in
//                    self.chatLabel.text?.append(letter)
//                }
//            charIndex += 1
//        }
    }
    
    //MARK: - flow funcs
    
    @objc private func registerButtonTaped() {
        let controller = RegisterViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func logInButtonTaped() {
        let controller = LoginViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - public
}

//MARK: - extensions setupViews

extension WelcomeViewController {
    
    private func setupViews() {
        view.addSubview(chatLabel)
        view.addSubview(registerButton)
        view.addSubview(logInButton)
    }
}

//MARK: - extensions setConstraints

extension WelcomeViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            chatLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chatLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            chatLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: chatLabel.bottomAnchor, constant: 270),
            registerButton.widthAnchor.constraint(equalToConstant: view.frame.width),
            registerButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 4),
            logInButton.widthAnchor.constraint(equalToConstant: view.frame.width),
            logInButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

