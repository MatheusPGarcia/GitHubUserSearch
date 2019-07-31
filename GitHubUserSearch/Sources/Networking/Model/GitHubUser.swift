//
//  GitHubUser.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

struct GitHubUser: Decodable {

    var name: String
    var avatarUrl: URL?
}

extension GitHubUser {

    enum JsonKeys: String, CodingKey {

        case name = "login"
        case avatarUrl = "avatar_url"
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: JsonKeys.self)

        name = try container.decode(String.self, forKey: .name)
        let avatarStringUrl = try container.decode(String.self, forKey: .avatarUrl)

        avatarUrl = URL(string: avatarStringUrl)
    }
}
