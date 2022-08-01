//
//  MessageEntity.swift
//  Messenger
//
//  Created by Chung Nguyen on 6/12/22.
//

import Foundation

struct MessageEntity: Codable {
    let dateSent: TimeInterval
    let content: String
    let author: Int
    let converation: Int
}

extension MessageEntity {
    static func fromDomain(_ message: Message) -> MessageEntity {
        return MessageEntity(dateSent: message.time,
                             content: message.content,
                             author: message.author?.id ?? 0,
                             converation: message.room?.roomId ?? 0)
    }
    
    func toDomain() -> Message {
        return Message(time: dateSent,
                       content: content)
    }
}
