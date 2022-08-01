//
//  RoomRepository.swift
//  Messenger
//
//  Created by Chung Nguyen on 6/12/22.
//

import Foundation

protocol RoomRepository {
    func loadRoom(_ completion: @escaping (Result<Room, Error>)->Void)
}
