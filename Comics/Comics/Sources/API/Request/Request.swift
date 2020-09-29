//
//  Request.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import Foundation
import Alamofire

struct Request<Response: Decodable> {
    public let method: HTTPMethod
    public let path: String
    public let parameters: Parameters
    
    init(method: HTTPMethod,
         path: String,
         parameters: Parameters = Parameters()) {
        self.method = method
        self.path = path
        self.parameters = parameters
    }
}
