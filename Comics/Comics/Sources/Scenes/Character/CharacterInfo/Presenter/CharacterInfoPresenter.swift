//
//  CharacterInfoPresenter.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import Foundation

final class CharacterInfoPresenter {
    weak var view: CharacterInfoViewable!
    var router: CharacterInfoRoutable!
    private let character: Character
    
    init(character: Character) {
        self.character = character
    }
}

extension CharacterInfoPresenter: CharacterInfoPresentable {
    func viewDidLoad() {
        view.startLoading()
        view
            .render(
                viewModel: CharacterInfoViewModel(title: character.publisher.name,
                                                  description: character.description.or(""))
        )
    }
    
    func onCloseButtonClicked() {
        router.closeController()
    }
}
