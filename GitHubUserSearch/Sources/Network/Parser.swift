//
//  Parser.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

class Parser {

    static func parseData<T: Decodable>(_ data: Data,
                                        ofType type: T.Type) throws -> T {

        let decoder = JSONDecoder()

        let object = try decoder.decode(T.self, from: data)
        return object
    }
}
