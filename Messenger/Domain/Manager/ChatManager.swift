//
//  ChatManager.swift
//  Messenger
//
//  Created by Chung Nguyen on 6/12/22.
//

import Foundation

protocol ChatManager {
    var dataAccess: ChatDataAccess { get }
    func sendMessage(_ message: Message) async throws
    func loadMessages() async throws -> [Message]
    func loadUsers() async throws -> [Person]
}

struct ChatManagerImpl: ChatManager {
    let dataAccess: ChatDataAccess
    func sendMessage(_ message: Message) async throws {
        try await dataAccess.sendMessage(message)
    }
    func loadMessages() async throws -> [Message] {
        try await dataAccess.loadMessages()
    }
    func loadUsers() async throws -> [Person] {
        try await dataAccess.loadUsers()
    }
}
