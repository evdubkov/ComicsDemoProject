//
//  Publisher.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import Foundation

struct Publisher: Decodable, Equatable {
    let apiDetailUrl: URL
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case apiDetailUrl = "api_detail_url"
        case id, name
    }
}
