//
//  RegisterViewController.swift
//  FlashChat
//
//  Created by Ildar Garifullin on 13/03/2023.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    //MARK: - let/var
    
    private let emailTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
        field.layer.cornerRadius = 15
        field.textColor = .black
        field.returnKeyType = .done
        field.backgroundColor = .gray
        field.textAlignment = .center
        field.returnKeyType = .done
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    private let passwordTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.layer.cornerRadius = 15
        field.textColor = .black
        field.returnKeyType = .done
        field.backgroundColor = .gray
        field.textAlignment = .center
        field.returnKeyType = .done
        field.isSecureTextEntry = true
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(registerButtonTaped), for: .touchUpInside)
        
        return button
    }()
    
    private let chatLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - life cycle funcs

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setConstraints()
    }
    
    //MARK: - flow funcs
    
    @objc private func registerButtonTaped() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.chatLabel.text = error.localizedDescription
            } else {
                let controller = ChatViewController()
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
    
    //MARK: - public
    
}

//MARK: - extensions setupViews

extension RegisterViewController {
    
    private func setupViews() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        view.addSubview(chatLabel)
    }
}

//MARK: - extensions setConstraints

extension RegisterViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            registerButton.widthAnchor.constraint(equalToConstant: 300),
            registerButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            chatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            chatLabel.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 10),
            chatLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            chatLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
