//
//  Parser.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation
import Moya

class Parser {

    static func parseResult<T: Decodable>(moyaResponse: Response,
                                          ofType type: T.Type,
                                          completion: ((Swift.Result<T, Error>) -> Void)? = nil) {

        let decoder = JSONDecoder()
        do {

            let object = try moyaResponse.map(T.self, using: decoder)
            completion?(.success(object))
        } catch {

            completion?(.failure(error))
        }
    }
}
