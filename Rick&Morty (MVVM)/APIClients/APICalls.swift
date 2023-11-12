//
//  APICalls.swift
//  Rick&Morty (MVVM)
//
//  Created by Alvaro Gomez Garcia on 9/11/23.
//

import Foundation

//final class: Una clase marcada como "final" no puede ser extendida o heredada por ninguna otra clase. Esto significa que no se pueden crear subclases o clases derivadas a partir de ella. Esto se utiliza cuando se desea impedir que una clase sea modificada o extendida.

// Este API será para obtener Rick&Morty data
final class APICalls {
    
    //static: Se utiliza para definir una propiedad estática de sólo lectura en una clase, y no se puede modificar después de su inicialización.
    static let shared = APICalls()
    
    // Constructor
    // Una clase tiene que tener inicializador
    private init() {}
    
    enum APICallError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    // Send Rick&Morty API call || completion: Callback with data or error
    // <T: Codable> : Se refiere a un tipo T generico de especificacion codable que se utiliza para codificar y decodificar topos de datos en formato Json
    
    public func execute<T: Codable>(_ request: RequestRM, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void
    ) {                                                                                             // Result<Success, Failure>
   
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(APICallError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? APICallError.failedToGetData))
                //Aquí pensamos que el error puede ser cargando el data ó,  el error esté al obtener el data
                return
            }
            
            //Decode de response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                print("Decodificando los datos en el 'type' selecionado")
                completion(.success(result))
                //print(String(describing: result))
            } catch {
                print("Entro en el catch del do")
                completion(.failure(error))
            }
            
        }
        task.resume()
        
    }
    
    private func request(from rmRequest: RequestRM) -> URLRequest? {
        guard let url = rmRequest.url else {return nil}
        
        var peticionUrl = URLRequest(url: url)
        print("Esta es la api a la cual estas haciendo la petición:" , peticionUrl)
        
        peticionUrl.httpMethod = rmRequest.httpMethod
        
        return peticionUrl
    }
    
}
