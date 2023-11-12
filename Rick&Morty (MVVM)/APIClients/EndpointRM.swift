//
//  EndpointRM.swift
//  Rick&Morty (MVVM)
//
//  Created by Alvaro Gomez Garcia on 9/11/23.
//

import Foundation

//frozen: Este modificador indica que este tipo enumerado es de acceso público y no puede ser extendido o modificado.
@frozen enum EndpointRM: String {
    
    // Endpoint to get character info
    case character                               //Es lo mismo que poner case character = "character" -- Pero mejor simplificado
    // Endpoint to get location info
    case location
    // Endpoint to get episode info
    case episode
    
}
