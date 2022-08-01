//
//  ChatViewModel.swift
//  Messenger
//
//  Created by Chung Nguyen on 6/12/22.
//

import Foundation

protocol ChatViewModel {
    var room: Room? { get set }
    var manager: ChatManager { get set }
    func addMessage(_ message: String)
    func loadFromDB()
}

protocol ChatViewModelDelegate: AnyObject {
    func didChange()
}

class ChatViewModelImpl: ChatViewModel {
    var room: Room?
    var currentUser: Person?
    var aiUser: Person?
    var manager: ChatManager
    weak var delegate: ChatViewModelDelegate?
    
    init(manager: ChatManager) {
        self.manager = manager
        room = Room(roomId: 1, roomName: "")
    }
    
    func addMessage(_ message: String) {
        Task {
            let time = Date().timeIntervalSince1970
            let messageObject = Message(time: time,
                                        content: message)
            messageObject.room = room
            messageObject.author = currentUser
            room?.messages.append(messageObject)
            try? await manager.sendMessage(messageObject)
            delegate?.didChange()
            
            let randomDelay = UInt64.random(in: 1000000000...10000000000)
            try await Task.sleep(nanoseconds: randomDelay)
            try? await addAIMessage(message + " AI")
        }
    }
    
    func addAIMessage(_ message: String) async throws {
        let time = Date().timeIntervalSince1970
        let messageObject = Message(time: time,
                                    content: message)
        messageObject.room = room
        messageObject.author = aiUser
        room?.messages.append(messageObject)
        try await manager.sendMessage(messageObject)
        delegate?.didChange()
    }
    
    func loadFromDB() {
        Task {
            room?.messages = []
            let users = try await manager.loadUsers()
            currentUser = users[0]
            aiUser = users[1]
            
            let messages = try await manager.loadMessages()
            for message in messages {
                if message.authorId == currentUser?.id {
                    message.author = currentUser
                } else {
                    message.author = aiUser
                }
                room?.messages.append(message)
            }
            delegate?.didChange()
        }
    }
}
