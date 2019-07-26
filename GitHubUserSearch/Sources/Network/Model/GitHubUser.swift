//
//  GitHubUser.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

struct GitHubUser: Decodable {

    var name: String
    var avatarUrl: String
}

extension GitHubUser {

    enum JsonKeys: String, CodingKey {

        case name = "login"
        case avatarUrl = "avatar_url"
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: JsonKeys.self)

        name = try container.decode(String.self, forKey: .name)
        avatarUrl = try container.decode(String.self, forKey: .avatarUrl)
    }
}
