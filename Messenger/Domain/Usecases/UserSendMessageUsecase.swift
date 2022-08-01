//
//  UserSendMessageUsecase.swift
//  Messenger
//
//  Created by Chung Nguyen on 6/12/22.
//

import Foundation

protocol UserSendMessageUsecase {
    var messageRepo: MessageRepository { get set }
    func sendMessage(_ message: Message, completion: @escaping (Error?)->Void)
}


