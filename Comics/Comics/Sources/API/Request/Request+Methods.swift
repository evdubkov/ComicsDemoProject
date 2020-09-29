//
//  Request+Methods.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import Foundation

extension Request {
    static func getCharacters(offset: Int,
                              limit: Int = 50) -> Request<ItemPaginatedList<Character>> {
        .init(
            method: .get,
            path: "characters",
            parameters: [
                "offset": offset,
                "limit": limit]
        )
    }
}
