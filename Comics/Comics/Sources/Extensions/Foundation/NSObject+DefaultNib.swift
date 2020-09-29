//
//  NSObject+DefaultNib.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import UIKit

extension NSObject {
    
    final var className: String {
        return type(of: self).className
    }

    static var className: String {
        let classWithModuleAndGenericQuotes = NSStringFromClass(self)
        guard let classNameWithGenericQuotes = classWithModuleAndGenericQuotes.components(separatedBy: ".").last,
            let className = classNameWithGenericQuotes.components(separatedBy: "<").first else {
            fatalError("\(#function) -> Bad string created for class: \(self)")
        }
        return className
    }
    
    static var defaultNib: UINib {
        return UINib.init(nibName: self.className, bundle: nil)
    }
}

