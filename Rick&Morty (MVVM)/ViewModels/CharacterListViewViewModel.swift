//
//  CharacterViewViewModel.swift
//  Rick&Morty (MVVM)
//
//  Created by Alvaro Gomez on 12/11/23.
//

import UIKit

final class CharacterListViewViewModel: NSObject {

    func fetchCharacters() {
        
        APICalls.shared.execute(.listaCharactersRequest, expecting: GetAllCharactersStructRM.self) { result in
            switch result {
            case .success(let model):
                print("Se han decodificado los datos con la estructura 'GetAllCharactersStructRM'")
                print("Total characters: " + String(model.info.count))
                print("Characters for these page: " + String(model.results.count))
                //print(String(describing: model))
            case .failure(let failure):
                print("Fallo 1")
                print(String(describing: failure))
            }
        }
        
    }
    
}

//Esto parece mucho lio pero solamente es:
//-1: Numero de celdas que voy a dar a este ViewModel
//-2: Para cada numero de celda darle la interfaz de celda con UICollectionViewCell
extension CharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemGray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //bounds = medidas
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(
            width: width, height: width * 1.5)
    }
}
