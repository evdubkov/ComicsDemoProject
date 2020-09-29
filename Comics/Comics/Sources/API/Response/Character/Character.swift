//
//  Character.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import Foundation

struct Character: Decodable, Equatable {
    let dateAdded: Date
    let deck: String?
    let description: String?
    let publisher: Publisher
    let name: String
    let realName: String?
    
    enum CodingKeys: String, CodingKey {
        case dateAdded = "date_added"
        case deck
        case description
        case publisher
        case name
        case realName = "real_name"
    }
}
