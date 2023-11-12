//
//  GetAllCharactersStructRM.swift
//  Rick&Morty (MVVM)
//
//  Created by Alvaro Gomez on 12/11/23.
//

import Foundation

struct GetAllCharactersStructRM: Codable {
    
    struct InfoAllCharacters: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    
    let info: InfoAllCharacters
    let results: [CharacterRM]

}

