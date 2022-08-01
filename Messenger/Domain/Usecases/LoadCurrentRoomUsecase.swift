//
//  LoadCurrentRoomUsecase.swift
//  Messenger
//
//  Created by Chung Nguyen on 6/12/22.
//

import Foundation

protocol LoadCurrentRoomUsecase {
    var roomRepo: RoomRepository { get set }
    func loadRoom(_ comletion: @escaping (Result<Room, Error>)->Void)
}
