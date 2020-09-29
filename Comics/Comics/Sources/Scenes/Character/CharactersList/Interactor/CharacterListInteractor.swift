//
//  CharacterListInteractor.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import Foundation

final class CharacterListInteractor {
    private let client = Client()
}

extension CharacterListInteractor: CharacterListInteractable {
    func loadCharacters(offset: Int,
                        completion: @escaping ((Result<[Character], Error>) -> Void)) {
        client
            .request(
                .getCharacters(offset: offset)
            ) { result in
                switch result {
                case .success(let list):
                    completion(.success(list.results))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
}
