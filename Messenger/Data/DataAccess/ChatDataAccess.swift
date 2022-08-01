//
//  ChatDataAccess.swift
//  Messenger
//
//  Created by Chung Nguyen on 6/12/22.
//

import Foundation

protocol ChatDataAccess: TableDataAccess {
    func sendMessage(_ message: Message) async throws
    func loadMessages() async throws -> [Message]
    func loadUsers() async throws -> [Person]
}

struct ChatDataAccessImpl: ChatDataAccess {
    var jsonEncoder: JSONEncoderProtocol
    var jsonDecoder: JSONDecoderProtocol
    var userDefault: UserDefaultsProtocol
    
    struct Constants {
        static let messageTable = "message"
        static let personTable = "person"
    }
    
    func sendMessage(_ message: Message) async throws {
        var messageEntities = try readTable([MessageEntity].self,
                                            Constants.messageTable) ?? []
        let messageEntity = MessageEntity.fromDomain(message)
        messageEntities.append(messageEntity)
        try saveTable(messageEntities, Constants.messageTable)
    }
    
    func loadMessages() async throws -> [Message] {
        let messageEntities = try readTable([MessageEntity].self,
                                            Constants.messageTable) ?? []
        var result: [Message] = []
        for messageEntity in messageEntities {
            let message = messageEntity.toDomain()
            message.authorId = messageEntity.author
            result.append(message)
            
        }
        return result
    }
    
    func loadUsers() async throws -> [Person] {
        var userEntities = try readTable([UserEntity].self,
                                         Constants.personTable) ?? []
        if userEntities.count == 0 {
            userEntities.append(UserEntity(id: 1, username: "chung1991"))
            userEntities.append(UserEntity(id: 2, username: "hanhnv"))
        }
        
        var result: [Person] = []
        for userEntity in userEntities {
            let user = userEntity.toDomain()
            result.append(user)
            
        }
        try saveTable(userEntities, Constants.personTable)
        return result
    }
}
