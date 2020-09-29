//
//  CharactrerInfoRouter.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import Foundation
 
final class CharactrerInfoRouter {
    weak var viewController: CharacterInfoViewController!
    
    init(viewController: CharacterInfoViewController) {
        self.viewController = viewController
    }
}

extension CharactrerInfoRouter: CharacterInfoRoutable {
    func closeController() {
        viewController.dismiss(animated: true)
    }
}
