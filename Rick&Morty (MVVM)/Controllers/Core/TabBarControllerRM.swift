//
//  ViewController.swift
//  Rick&Morty (MVVM)
//
//  Created by Alvaro Gomez Garcia on 9/11/23.
//

import UIKit

//final class: Una clase marcada como "final" no puede ser extendida o heredada por ninguna otra clase. Esto significa que no se pueden crear subclases o clases derivadas a partir de ella. Esto se utiliza cuando se desea impedir que una clase sea modificada o extendida.

//UITabBarController: se utiliza para gestionar varias vistas o controladores de vista en un mismo espacio de pantalla dividido en pestañas
final class TabBarControllerRM: UITabBarController {

    //override: Se utiliza para sobresicribir un método que ya existe en la base
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //view.backgroundColor = .blue
        setUpTabs()
    }
    
    //private: Hace que no pueda acceder a esta funcion otra clase que no sea esta
    private func setUpTabs(){
        let characterVC = CharacterViewControllerRM()
        let locationVC = LocationViewControllerRM()
        let episodeVC = EpisodeViewControllerRM()
        let settingsVC = SettingsViewControllerRM()
        
        //El .automatic lo que hace es: 1-Para empezar abajo hemos seteado los titles = large. 2-El .largeTitleDisplayMode lo que hace es que siempre que un title se haya seteado como large, sea automatico en funcion de las opciones de tamaño de texto del móvil.
        characterVC.navigationItem.largeTitleDisplayMode = .automatic
        locationVC.navigationItem.largeTitleDisplayMode = .automatic
        episodeVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: characterVC)
        let nav2 = UINavigationController(rootViewController: locationVC)
        let nav3 = UINavigationController(rootViewController: episodeVC)
        let nav4 = UINavigationController(rootViewController: settingsVC)
        
        //Ponemos la letra más grande
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        //Seteamos iconos
        nav1.tabBarItem = UITabBarItem(title: "Characters",
                                       image: UIImage(systemName: "person"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Locations",
                                       image: UIImage(systemName: "globe"),
                                       tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Episodes",
                                       image: UIImage(systemName: "tv"),
                                       tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Settings",
                                       image: UIImage(systemName: "gear"),
                                       tag: 4)
        
        //Esta función ya está definida y la podemos utulizar ya que está en el UITabBarController
        //Aqui seteas los TabBar que quieres
        setViewControllers(
            [nav1, nav2, nav3, nav4],
            animated: true
        )
    }


}

