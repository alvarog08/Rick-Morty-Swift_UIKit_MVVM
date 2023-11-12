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

    private let characterListView = CharacterListView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground //Esto significa que si el sistema del movil esta en light mode lo muestra y si está en dark pues muestra ese
        title = "Characters"
        //Si estuvieramos en una view como en CharacterListView esto podria ser solo: addSubview(characterListView), porque ya estariamos en una vista
        view.addSubview(characterListView)
        //Esto significa que los bordes estan alineados por la parte de arriba,abajo,der y izq, teniendo en cuenta que puede ser cualquier dispositivo con una interfaz diferente... iphone 14 - ipad - iphone 7
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}
