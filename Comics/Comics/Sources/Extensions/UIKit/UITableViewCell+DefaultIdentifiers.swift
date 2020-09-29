//
//  UITableViewCell+DefaultIdentifiers.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import UIKit

extension UIView {
    class var defaultReuseIdentifier: String {
        self.className
    }
}

