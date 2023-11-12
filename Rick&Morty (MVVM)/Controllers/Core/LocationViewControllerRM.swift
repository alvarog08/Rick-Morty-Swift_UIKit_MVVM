//
//  LocationViewController.swift
//  Rick&Morty (MVVM)
//
//  Created by Alvaro Gomez Garcia on 9/11/23.
//

import UIKit

//final class: Una clase marcada como "final" no puede ser extendida o heredada por ninguna otra clase. Esto significa que no se pueden crear subclases o clases derivadas a partir de ella. Esto se utiliza cuando se desea impedir que una clase sea modificada o extendida.

//Controller to show and search Locations
final class LocationViewControllerRM: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground //Esto significa que si el sistema del movil esta en light mode lo muestra y si está en dark pues muestra ese
        title = "Locations"
    }
    


}
