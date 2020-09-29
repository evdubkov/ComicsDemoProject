//
//  DateFormatter.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static let `default`: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        return dateFormatter
    }()
    
    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }
}
