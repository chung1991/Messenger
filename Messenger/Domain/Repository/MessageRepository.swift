//
//  MessageRepository.swift
//  Messenger
//
//  Created by Chung Nguyen on 6/12/22.
//

import Foundation

protocol MessageRepository {
    func add(_ message: Message, completion: @escaping (Error?)->Void)
}
