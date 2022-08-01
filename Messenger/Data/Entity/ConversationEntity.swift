//
//  ConversationEntity.swift
//  Messenger
//
//  Created by Chung Nguyen on 6/12/22.
//

import Foundation

struct ConversationEntity: Codable {
    let id: Int
    let name: String
}

extension ConversationEntity {
    static func fromDomain(_ room: Room) -> ConversationEntity {
        return ConversationEntity(id: room.roomId,
                                  name: room.roomName)
    }
    
    func toDomain() -> Room {
        return Room(roomId: id,
                    roomName: name)
    }
}
