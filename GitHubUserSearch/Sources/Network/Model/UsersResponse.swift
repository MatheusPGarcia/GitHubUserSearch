//
//  UsersResponse.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

struct UsersResponse: Decodable {

    var usersCount: Int
    var incompleteResult: Bool
    var users: [GitHubUser]
}

extension UsersResponse {

    enum JsonKeys: String, CodingKey {

        case usersCount = "total_count"
        case incompleteResult = "incomplete_results"
        case users = "items"
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: JsonKeys.self)

        usersCount = try container.decode(Int.self, forKey: .usersCount)
        incompleteResult = try container.decode(Bool.self, forKey: .incompleteResult)
        users = try container.decode([GitHubUser].self, forKey: .users)
    }
}
