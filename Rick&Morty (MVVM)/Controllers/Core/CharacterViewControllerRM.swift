//
//  CharacterViewController.swift
//  Rick&Morty (MVVM)
//
//  Created by Alvaro Gomez Garcia on 9/11/23.
//

import UIKit

final class CharacterViewControllerRM: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground //Esto significa que si el sistema del movil esta en light mode lo muestra y si está en dark pues muestra ese
        title = "Characters"
    }
    

}
