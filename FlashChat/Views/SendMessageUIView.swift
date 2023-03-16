//
//  SendMessageUIView.swift
//  FlashChat
//
//  Created by Ildar Garifullin on 15/03/2023.
//

import UIKit

class SendMessageUIView: UIView {
    
    //MARK: - let/var
    
    private let messageTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Write a message... "
        field.layer.cornerRadius = 4
        field.textColor = .black
        field.returnKeyType = .done
        field.backgroundColor = .white
        field.textAlignment = .left
        field.returnKeyType = .done
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "paperplane.fill")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    //MARK: - life cycle funcs
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        
        backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - flow funcs
    
    @objc private func sendButtonTapped() {
        print("sendButtonTapped")
    }
    
    //MARK: - public
    
}

//MARK: - extensions setupViews

extension SendMessageUIView {
    
    private func setupViews() {
        addSubview(messageTextField)
        addSubview(sendButton)
    }
}

//MARK: - extensions setConstraints

extension SendMessageUIView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            messageTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            messageTextField.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            messageTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -10),
            messageTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            sendButton.leadingAnchor.constraint(equalTo: messageTextField.trailingAnchor, constant: 10),
            sendButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            sendButton.widthAnchor.constraint(equalToConstant: 40),
            sendButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
