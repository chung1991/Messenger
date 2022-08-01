//
//  ViewController.swift
//  Messenger
//
//  Created by Chung Nguyen on 6/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var messageTable: UITableView!
    @IBOutlet var textBox: UITextField!
    @IBOutlet var sendButton: UIButton!
    
    var viewModel = ChatViewModelImpl(
        manager: ChatManagerImpl(
            dataAccess: ChatDataAccessImpl(
                jsonEncoder: JSONEncoder(),
                jsonDecoder: JSONDecoder(),
                userDefault: UserDefaults.standard)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupDelegates()
        fetchData()
    }
    
    func setupViews() {
        messageTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func fetchData() {
        viewModel.loadFromDB()
    }
    
    func setupDelegates() {
        messageTable.delegate = self
        messageTable.dataSource = self
        viewModel.delegate = self
    }

    @IBAction func didSend() {
        let message = textBox.text ?? ""
        guard !message.isEmpty else {
            return
        }
        textBox.text = ""
        viewModel.addMessage(message)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.room?.messages.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let messages = viewModel.room?.messages else {
            return UITableViewCell()
        }
        let message = messages[indexPath.row]
        let imageName = message.authorId == 1 ? "person.fill" : "person"
        cell.imageView?.image = UIImage(systemName: imageName)
        let textAlignment: NSTextAlignment = message.authorId == 1 ? .left : .right
        cell.textLabel?.textAlignment = textAlignment
        cell.textLabel?.text = message.content
        
        return cell
    }
}

extension ViewController: ChatViewModelDelegate {
    func didChange() {
        DispatchQueue.main.async { [weak self] in
            self?.messageTable.reloadData()
        }
    }
}
