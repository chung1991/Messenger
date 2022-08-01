//
//  OfflineDataSource.swift
//  Messenger
//
//  Created by Chung Nguyen on 6/12/22.
//

import Foundation

struct OfflineDataSource: DataSource {
    func loadMessages(conversation: Int, _ completion: @escaping (Result<MessageEntity, Error>) -> Void) {
    }
    
    func loadUsers(conversation: Int, _ completion: @escaping (Result<UserEntity, Error>) -> Void) {
        
    }
    
    func loadCurrentConveration(user: Int, _ completion: @escaping (Result<ConversationEntity, Error>) -> Void) {
        
    }
    
    func addMessage(message: MessageEntity, _ completion: @escaping (Error?) -> Void) {
        
    }

}
