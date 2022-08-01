//
//  RoomRepositoryImpl.swift
//  Messenger
//
//  Created by Chung Nguyen on 6/12/22.
//

import Foundation

struct RoomRepositoryImpl: RoomRepository {
    let dataSource: DataSource
    let dispatchGroup: DispatchGroup = DispatchGroup() // DI later
    func loadRoom(_ completion: @escaping (Result<Room, Error>) -> Void) {
        let userId = -1 // N/A
        
        dispatchGroup.enter()
        dataSource.loadCurrentConveration(user: userId) { result in
            switch result {
            case .success(let converation):
                let room = converation.toDomain()
                completion(.success(room))
            case .failure(let error):
                completion(.failure(error))
            }
            dispatchGroup.leave()
        }
        
        
    }
    
    
}
