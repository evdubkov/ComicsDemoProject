//
//  UITableView.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_ cell: T.Type) {
        register(
            T.defaultNib,
            forCellReuseIdentifier: T.defaultReuseIdentifier
        )
    }
    
    func dequeue<T: UITableViewCell>(_ cellType: T.Type = T.self,
                                     withIdentifier identifier: String = T.defaultReuseIdentifier,
                                     for index: IndexPath) -> T {
        let cell = dequeueReusableCell(
            withIdentifier: identifier,
            for: index
        )
        guard let casted = cell as? T else {
            fatalError("Failed to dequeue cell of type = \(String(describing: T.self))")
        }
        return casted
    }
}
