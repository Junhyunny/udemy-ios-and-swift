//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let database = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMessages()
        
        title = Constants.appName
        
        // 뒤로가기 버튼 delete
        navigationItem.hidesBackButton = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // 프로그래밍으로 메세지 셀 등록
        tableView.register(
            UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier
        )
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text,
           let messageSender = Auth.auth().currentUser?.email {
            database
                .collection(Constants.FStore.collectionName)
                .addDocument(data: [Constants.FStore.senderField: messageSender,
                                    Constants.FStore.bodyField: messageBody,
                                    Constants.FStore.dateField: Date().timeIntervalSince1970])
            {(error) in
                if let err = error {
                    print("Fail \(err)")
                } else {
                    print("Success")
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                }
            }
        }
    }
    
    
    func loadMessages() {
//        database
//            .collection(Constants.FStore.collectionName)
//            .getDocuments {(quertSnapshot, error) in
//                if let err = error {
//                    print("There was an issue retrieving data from database \(err)")
//                    return
//                }
//                if let snapshotDocuments = quertSnapshot?.documents {
//                    for document in snapshotDocuments {
//                        let data = document.data()
//                        if let sender = data[Constants.FStore.senderField] as? String,
//                           let body = data[Constants.FStore.bodyField] as? String {
//                            self.messages.append(Message(sender: sender, body: body))
//                            DispatchQueue.main.async {
//                                self.tableView.reloadData()
//                            }
//                        }
//                    }
//                }
//            }
        database
            .collection(Constants.FStore.collectionName)
            .order(by: Constants.FStore.dateField)
            .addSnapshotListener {(quertSnapshot, error) in
                if let err = error {
                    print("There was an issue retrieving data from database \(err)")
                    return
                }
                self.messages = []
                if let snapshotDocuments = quertSnapshot?.documents {
                    for document in snapshotDocuments {
                        let data = document.data()
                        if let sender = data[Constants.FStore.senderField] as? String,
                           let body = data[Constants.FStore.bodyField] as? String {
                            self.messages.append(Message(sender: sender, body: body))
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            // iOS navigation back
            navigationController?.popViewController(animated: true)
        } catch let signOutError as NSError {
            print(signOutError)
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        
        let message = messages[indexPath.row]
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: Constants.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: "Black")
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: Constants.BrandColors.purple)
        }

        cell.label.text = message.body
        return cell
    }
}

extension ChatViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
