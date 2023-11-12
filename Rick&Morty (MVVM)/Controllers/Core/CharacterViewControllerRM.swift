//
//  CharacterViewController.swift
//  Rick&Morty (MVVM)
//
//  Created by Alvaro Gomez Garcia on 9/11/23.
//

//Esta clase esta creada con cocoaTouch: que se utiliza para controlar y modificar interfaz de la app
//Sin embargo si creasemos un swift file sirve para los controllers..viewmodel..view..

import UIKit

//final class: Una clase marcada como "final" no puede ser extendida o heredada por ninguna otra clase. Esto significa que no se pueden crear subclases o clases derivadas a partir de ella. Esto se utiliza cuando se desea impedir que una clase sea modificada o extendida.

//Controller to show and search Characters
final class CharacterViewControllerRM: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground //Esto significa que si el sistema del movil esta en light mode lo muestra y si está en dark pues muestra ese
        title = "Characters"
        
        APICalls.shared.execute(.listaCharactersRequest, expecting: GetAllCharactersStructRM.self) { result in
            switch result {
            case .success(let model):
                print("Se han decodificado los datos con la estructura 'GetAllCharactersStructRM'")
                print(String(describing: model))
            case .failure(let failure):
                print("Fallo 1")
                print(String(describing: failure))
            }
        }
        
        
    }
    

}
