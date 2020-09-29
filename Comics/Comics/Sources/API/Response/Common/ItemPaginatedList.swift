//
//  ItemPaginatedList.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import Foundation

struct ItemPaginatedList<Item: Decodable & Equatable>: Decodable, Equatable {
    
    let error: String
    let limit: Int
    let offset: Int
    let numberOfPageResults: Int
    let numberOfTotalResults: Int
    let results: [Item]
    
    enum CodingKeys: String, CodingKey {
        case error, limit, offset
        case numberOfPageResults = "number_of_page_results"
        case numberOfTotalResults = "number_of_total_results"
        case results
    }
}
