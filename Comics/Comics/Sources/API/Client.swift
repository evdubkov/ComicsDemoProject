//
//  Client.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import Foundation
import Alamofire

final class Client {
    private var host: URL {
        guard
            let url = URL(string: "https://www.comicvine.com/api/")
            else {
                fatalError("Not get valid url")
        }
        return url
    }
    
    private var defaultParameters: Parameters {
        ["api_key": "713b745667fa487aa9f84853724fafd509fcbf85",
         "format":"json"]
    }
    
    private let session: Session
    private let requestTimeout: TimeInterval
    private let responseDecoder: JSONDecoder
    private let responseProcessingQueue: DispatchQueue
    
    init(requestTimeout: TimeInterval = 60) {
        self.session = .default
        self.requestTimeout = requestTimeout
        self.responseDecoder = JSONDecoder()
        self.responseDecoder.dateDecodingStrategy = .formatted(.default)
        self.responseProcessingQueue = DispatchQueue(
            label: "com.evdubkov.comics.api.responseProcessingQueue"
        )
    }
    
    func request<Response>(_ req: Request<Response>,
                           completion: @escaping (Result<Response, Error>) -> Void) {
        session
            .request(
                host.appendingPathComponent(req.path),
                method: req.method,
                parameters: req.parameters.adding(defaultParameters),
                encoding: encoding(req.method)
        ).responseDecodable(of: Response.self,
                            queue: responseProcessingQueue,
                            decoder: responseDecoder,
                            emptyResponseCodes: Set([200, 204, 205])
        ) { response in
            DispatchQueue.main.async {
                response.value.onSome {
                    completion(.success($0))
                }
                response.error.onSome {
                    completion(.failure($0))
                }
            }
        }
    }
    
    private func encoding(_ httpMethod: HTTPMethod) -> ParameterEncoding {
        switch httpMethod {
        case .get:
            return URLEncoding.default
        case .post, .delete:
            return JSONEncoding.default
        default:
            fatalError("\(#function) -> method '\(httpMethod)' is unsupported")
        }
    }
}

private extension Parameters {
    func adding(_ parameters: Parameters) -> Parameters {
        var tmp = self
        parameters.forEach {
            tmp[$0.key] = $0.value
        }
        return tmp
    }
}
