//
//  CharacterInfoModule.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import Foundation

protocol CharacterInfoViewable: AnyObject {
    func startLoading()
    func stopLoading()
    func render(viewModel: CharacterInfoViewModel)
}

protocol CharacterInfoPresentable: AnyObject {
    func viewDidLoad()
    func onCloseButtonClicked()
}

protocol CharacterInfoRoutable {
    func closeController()
}
