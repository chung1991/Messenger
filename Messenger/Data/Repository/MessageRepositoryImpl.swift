//
//  MessageRepositoryImpl.swift
//  Messenger
//
//  Created by Chung Nguyen on 6/12/22.
//

import Foundation

struct MessageRepositoryImpl: MessageRepository {
    let dataSource: DataSource
    func add(_ message: Message, completion: @escaping (Error?) -> Void) {
        let messageEntity = MessageEntity.fromDomain(message)
        dataSource.addMessage(message: messageEntity) { error in
            guard let error = error else {
                completion(nil)
                return
            }
            completion(error)
        }
    }
}
