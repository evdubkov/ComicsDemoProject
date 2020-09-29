//
//  CharacterListPresenter.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import Foundation

final class CharacterListPresenter {
    weak var view: CharacterListViewable!
    var interactor: CharacterListInteractable!
    var router: CharacterListRoutable!
}

extension CharacterListPresenter: CharacterListPresentable {
    
    func viewDidLoad() {
        onLoadMoreCharactersWithOffset(0, completion: nil)
    }
    
    func onLoadMoreCharactersWithOffset(_ offset: Int,
                                        completion: (() -> Void)?) {
        view.startLoading()
        interactor.loadCharacters(offset: offset) { [weak self] result in
            self?.view.stopLoading()
            switch result {
            case .success(let characters):
                self?.view.render(characters: characters, offset: offset)
            case .failure(let error):
                self?.router.showAlert(error: error)
            }
            completion?()
        }
    }
    
    func didSelectCell(with character: Character) {
        router.openCharacterInfoController(character)
    }
}
