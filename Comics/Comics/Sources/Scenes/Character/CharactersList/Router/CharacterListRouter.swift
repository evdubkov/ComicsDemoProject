//
//  CharacterListRouter.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import Foundation

final class CharacterListRouter {
    weak var viewController: CharacterViewController!
    
    init(viewController: CharacterViewController) {
        self.viewController = viewController
    }
}

extension CharacterListRouter: CharacterListRoutable {
    func showAlert(error: Error) {
        viewController
            .present(
                .alert(error: error),
                animated: true)
    }
    
    func openCharacterInfoController(_ character: Character) {
        let builder = CharacterInfoBuilder().setCharacter(character)
        let vc = builder.build()
        viewController.present(vc, animated: true)
    }
}
