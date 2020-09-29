//
//  Optional+Sugar.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import Foundation

extension Optional {
    
    func onSome(_ block: (Wrapped) -> Void) {
        map(block)
    }
    
    func or(_ fallback: @autoclosure () -> Wrapped) -> Wrapped {
        switch self {
        case let .some(value):
            return value
        case .none:
            return fallback()
        }
    }
}
