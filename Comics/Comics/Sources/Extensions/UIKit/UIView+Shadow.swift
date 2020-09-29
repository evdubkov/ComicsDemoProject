//
//  UIView+Shadow.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import UIKit

extension UIView {
    func applyShadow() {
        layer.masksToBounds = true
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 6, height: 6)
        layer.shadowRadius = 6
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(
            roundedRect: self.bounds,
            cornerRadius: self.layer.cornerRadius).cgPath
    }
}
