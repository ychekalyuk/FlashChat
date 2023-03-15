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
//        tableView.backgroundColor = .none
//        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
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
    }
}

//MARK: - extensions setConstraints

extension ChatViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            chatTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            chatTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatTableView.heightAnchor.constraint(equalToConstant: 400)
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


