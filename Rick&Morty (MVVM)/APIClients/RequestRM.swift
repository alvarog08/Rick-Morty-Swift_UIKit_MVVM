//
//  RequestRM.swift
//  Rick&Morty (MVVM)
//
//  Created by Alvaro Gomez Garcia on 9/11/23.
//

import Foundation

final class RequestRM {
    
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    //private: Aparte de que solo puedan acceder desde esta clase y no otra, lo que hace es que si alguien inspecciona nuestro codigo desde chrome mismo, no pueda ver como estan inicializadas estas variables
    private let endpoint: EndpointRM
    private let pathComponents: [String]
    //URLQueryItem: se usa par una estructura estilo nombre = parametro
    //page=19
    private let queryParameters: [URLQueryItem]
    
    //Construimos paspo por paso la url (FORMATO STRING)
    private var urlString: String {             //https://rickandmortyapi.com/api/character/?name=rick&status=alive
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue //Obtenemos como un .value, el valor selecciondo en el endpoint

        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }

        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({ //compactMap: Devuelve un array con los resultados no nulos de queryParameters
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"  // \($0.name) = \($0.value)
            }).joined(separator: "&")

            string += argumentString
        }

        return string
    }
    
    //Contruimos y trasformamos el API string en url
    public var url: URL? { //lo ponemos como ? porque puede ser que estemos en la pantalla de inicio y esa api no este inicializada y por lo tanto puede ser nil en ese momento
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    public init(
            endpoint: EndpointRM,
            pathComponents: [String] = [], //si estos no los setearamos vacios, serian nil y eso no puede ser /nil/ --> NO
            queryParameters: [URLQueryItem] = []
        ) {
            self.endpoint = endpoint
            self.pathComponents = pathComponents
            self.queryParameters = queryParameters
    }
}

extension RequestRM {
    static let listaCharactersRequest = RequestRM(endpoint: .character)
    
}
