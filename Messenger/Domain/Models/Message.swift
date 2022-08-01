//
//  Message.swift
//  Messenger
//
//  Created by Chung Nguyen on 6/12/22.
//

import Foundation

class Message {
    var time: TimeInterval
    var content: String
    weak var room: Room?
    weak var author: Person?
    var authorId: Int?
    
    init(time: TimeInterval, content: String) {
        self.time = time
        self.content = content
    }
}
