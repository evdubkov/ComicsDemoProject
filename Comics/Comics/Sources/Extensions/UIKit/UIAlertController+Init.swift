//
//  UIAlertController+Init.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static func alert(title: String? = nil,
                      message: String? = nil) -> UIAlertController {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(.ok)
        return alert
    }
    
    static func alert(error: Error) -> UIAlertController {
        alert(
            title: "Error",
            message: error.localizedDescription
        )
    }
}

extension UIAlertAction {
    
    static func `default`(title: String,
                          handler: (() -> Void)? = nil) -> UIAlertAction {
        UIAlertAction(
            title: title,
            style: .default) { (_) in
                handler?()
        }
    }

    static var ok: UIAlertAction {
        self.ok(nil)
    }
    
    static func ok(_ handler: (() -> Void)?) -> UIAlertAction {
        self.default(
            title: "OK",
            handler: handler
        )
    }
    
    static var cancel: UIAlertAction {
        self.cancel(nil)
    }
    
    static func cancel(_ handler: (() -> Void)?) -> UIAlertAction {
        UIAlertAction(
            title: "Cancel",
            style: .cancel
        ) { _ in
            handler?()
        }
    }
}
