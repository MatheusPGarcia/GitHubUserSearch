//
//  RepoViewModel.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 30/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

struct RepoViewModel {

    var name: String?
    var description: String?
    var language: String?
    var stars: Int?

    init() {

        name = nil
        description = nil
        language = nil
        stars = nil
    }

    init(repo: Repo) {

        name = repo.name
        description = repo.description
        language = repo.language
        stars = repo.stars
    }
}
