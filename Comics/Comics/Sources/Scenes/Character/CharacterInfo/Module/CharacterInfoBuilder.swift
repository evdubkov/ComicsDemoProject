//
//  CharacterInfoBuilder.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import UIKit

final class CharacterInfoBuilder: ModuleBuilder {
    
    private var character: Character?

    func setCharacter(_ character: Character) -> CharacterInfoBuilder {
        self.character = character
        return self
    }
    
    func build() -> UIViewController {
        guard
            let character = character
            else {
                fatalError("You should set a character")
        }
        let presenter = CharacterInfoPresenter(character: character)
        let controller = CharacterInfoViewController(presenter: presenter)
        let router = CharactrerInfoRouter(viewController: controller)
        
        presenter.view = controller
        presenter.router = router
        return controller
    }
}
