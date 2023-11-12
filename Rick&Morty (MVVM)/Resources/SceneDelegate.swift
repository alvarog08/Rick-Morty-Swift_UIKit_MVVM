//
//  SceneDelegate.swift
//  Rick&Morty (MVVM)
//
//  Created by Alvaro Gomez Garcia on 9/11/23.
//

import UIKit

//UIResponder: proporciona una interfaz para el manejo y respuesta a eventos táctiles, gestos y eventos relacionados con el teclado en una aplicación. Es la superclase de varias clases en iOS, incluyendo UIView y UIViewController, y permite que los objetos respondan a eventos de entrada.

//UIWindowSceneDelegate:  es un protocolo que se utiliza para controlar el ciclo de vida y las transiciones de las escenas en una aplicación

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    //UIWindow = es una clase en la biblioteca UIKit de iOS que representa una ventana en una aplicación
    var window: UIWindow?

    //A esta funcion se la llama siempre que conecte una escena, con una escena sesion con una opcionde conexion
    //En el parámetro de la función scene(_ scene: UIScene) significa que el argumento es omitible al llamar a la función. Esto implica que el parámetro de la función puede ser pasado o no,
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            
            //Se intenta convertir la variable scene a un objeto UIWindowScene
            //as? , si no lo consigue windowScene = nil
            guard let windowScene = (scene as? UIWindowScene) else { return }

            let vc = TabBarControllerRM()
            //Hasta aqui lo unico que ha echo ha sido coger la escena en la que estamos(se asegura de que hemos establecido conexión, y la hemos querido pasar a dicha escena un controlador el cual la modifica
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = vc
            window.makeKeyAndVisible()
        
            self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

