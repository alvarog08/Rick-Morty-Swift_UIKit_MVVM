//
//  CharacterListView.swift
//  Rick&Morty (MVVM)
//
//  Created by Alvaro Gomez on 12/11/23.
//

import UIKit

//Vista que maneja la view de lista de characters, loading, etc.
final class CharacterListView: UIView {
    
    private let viewModel = CharacterListViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
            let spinner = UIActivityIndicatorView(style: .large)
            spinner.hidesWhenStopped = true
            spinner.translatesAutoresizingMaskIntoConstraints = false
            return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout() //Para organizar los elementos de la cuadricula
        layout.scrollDirection = .vertical        //Aunque no haria falta porque por defecto es en vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10) //Esto alfinal es el margen entre las celdas y el margen del moviil
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2 , execute: {
            self.spinner.stopAnimating()
            self.collectionView.isHidden = false

            //por animarlo , pero se puede poner directamente la linea del alpha
            UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1
            }
        })
    }

    //Sobrescribimos el incializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Esta propiedad indica si el sistema de diseño automático de Auto Layout debe seleccionar automáticamente los ajustes predefinidos en las propiedades de posición y tamaño de la vista. Y como la ponemos a false, significa que establecemos nuestras propias restricciones
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(spinner)
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        spinner.startAnimating()
        setUpCollectionView()
    }

    //Esto hace que cuando la vista se instancia desde un archivo xib o storyboard sale este error, siendo incompatible con esta vista
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    
}
