//
//  Repo.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

struct Repo: Decodable {

    var name: String
    var description: String
    var url: String

    var language: String
    var issuesCount: Int
}

extension Repo {

    enum JsonKeys: String, CodingKey {

        case name
        case description
        case url = "html_url"
        case language = "language"
        case issuesCount = "open_issues_count"
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: JsonKeys.self)

        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        url = try container.decode(String.self, forKey: .url)
        language = try container.decode(String.self, forKey: .language)
        issuesCount = try container.decode(Int.self, forKey: .issuesCount)
    }
}
