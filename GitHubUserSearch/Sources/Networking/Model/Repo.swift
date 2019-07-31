//
//  Repo.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

struct Repo: Decodable {

    var name: String?
    var description: String?
    var url: String?

    var stars: Int?
    var language: String?
    var issuesCount: Int?
}

extension Repo {

    enum JsonKeys: String, CodingKey {

        case name
        case description
        case url = "html_url"
        case stars = "stargazers_count"
        case language = "language"
        case issuesCount = "open_issues_count"
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: JsonKeys.self)

        name = try container.decodeIfPresent(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        stars = try container.decodeIfPresent(Int.self, forKey: .stars)
        language = try container.decodeIfPresent(String.self, forKey: .language)
        issuesCount = try container.decodeIfPresent(Int.self, forKey: .issuesCount)
    }
}
