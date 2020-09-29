//
//  CharacterListModule.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import Foundation

protocol CharacterListViewable: AnyObject {
    func startLoading()
    func stopLoading()
    func render(characters: [Character],
                offset: Int)
}

protocol CharacterListPresentable: AnyObject {
    func viewDidLoad()
    func onLoadMoreCharactersWithOffset(_ offset: Int,
                                        completion: (() -> Void)?)
    func didSelectCell(with character: Character)
}

protocol CharacterListInteractable {
    func loadCharacters(offset: Int,
                        completion: @escaping ((Result<[Character], Error>) -> Void))
}

protocol CharacterListRoutable {
    func showAlert(error: Error)
    func openCharacterInfoController(_ character: Character)
}
