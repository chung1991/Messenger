//
//  Room.swift
//  Messenger
//
//  Created by Chung Nguyen on 6/12/22.
//

import Foundation

class Room {
    var roomId: Int
    var roomName: String
    var people: [Person]
    var messages: [Message]
    
    init(roomId: Int, roomName: String) {
        self.roomId = roomId
        self.roomName = roomName
        self.people = []
        self.messages = []
    }
}
