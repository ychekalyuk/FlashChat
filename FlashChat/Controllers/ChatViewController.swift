//
//  ChatViewController.swift
//  FlashChat
//
//  Created by Ildar Garifullin on 13/03/2023.
//

import UIKit

class ChatViewController: UIViewController {
    
    //MARK: - let/var
    
    private let idChatDetailTableViewCell = "idChatDetailTableViewCell"
    
    private let chatTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    var sendMessageUIView = SendMessageUIView()
    
    var navigationBar = UINavigationBar()
    
    //MARK: - life cycle funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setConstraints()
        
        setDelegate()
        
        chatTableView.register(ChatTableViewCell.self, forCellReuseIdentifier: idChatDetailTableViewCell)
    }
    
    //MARK: - flow funcs
    
    private func setDelegate() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
    }
    
    //MARK: - public
}

//MARK: - extensions setupViews

extension ChatViewController {
    
    private func setupViews() {
        view.addSubview(chatTableView)
        view.addSubview(sendMessageUIView)
        view.addSubview(navigationBar)
    }
}

//MARK: - extensions setConstraints

extension ChatViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            chatTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatTableView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            chatTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatTableView.bottomAnchor.constraint(equalTo: sendMessageUIView.topAnchor),
            chatTableView.heightAnchor.constraint(equalToConstant: 700)
        ])
        
        sendMessageUIView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sendMessageUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sendMessageUIView.topAnchor.constraint(equalTo: chatTableView.bottomAnchor),
            sendMessageUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            sendMessageUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: idChatDetailTableViewCell,
            for: indexPath
        ) as! ChatTableViewCell
        
        return cell
    }
}

//MARK: - UITableViewDelegate

extension ChatViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}


