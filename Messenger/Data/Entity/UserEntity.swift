//
//  UserEntity.swift
//  Messenger
//
//  Created by Chung Nguyen on 6/12/22.
//

import Foundation

struct UserEntity: Codable {
    let id: Int
    let username: String
}

extension UserEntity {
    static func fromDomain(_ person: Person) -> UserEntity {
        return UserEntity(id: person.id,
                          username: person.username)
    }
    
    func toDomain() -> Person {
        return Person(id: id,
                      username: username)
    }
}
