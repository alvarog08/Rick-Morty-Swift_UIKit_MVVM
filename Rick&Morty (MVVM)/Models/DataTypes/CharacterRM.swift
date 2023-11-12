//
//  CharactersRM.swift
//  Rick&Morty (MVVM)
//
//  Created by Alvaro Gomez Garcia on 9/11/23.
//

import Foundation

//codable: Nos permite decodificar al hacer el APICall

struct CharacterRM: Codable {
    
    let id: Int
    let name: String
    let status: CharacterStatusRM
    let species: String
    let type: String
    let gender: CharacterGenderRM
    let origin: OriginStructRM
    let location: LocationStructRM
    let image: String
    let episode: [String]
    let url: String
    let created: String

}

enum CharacterStatusRM: String, Codable {
    // 'Alive', 'Dead' or 'unknown'
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"

    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}

enum CharacterGenderRM: String, Codable {
    // 'Female', 'Male', 'Genderless' or 'unknown'
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
}
