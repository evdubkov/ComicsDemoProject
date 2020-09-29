//
//  CharacterListBuilder.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//
import UIKit

final class CharacterListBuilder: ModuleBuilder {

    func build() -> UIViewController {
        let presenter = CharacterListPresenter()
        let controller = CharacterViewController(presenter: presenter)
        let interactor = CharacterListInteractor()
        let router = CharacterListRouter(viewController: controller)
        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        return controller
    }
}
