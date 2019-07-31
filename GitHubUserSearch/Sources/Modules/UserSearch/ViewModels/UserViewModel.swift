//
//  UserViewModel.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 28/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import UIKit

struct UserViewModel {

    var name: String
    var userImageUrl: URL?

    init() {

        name = ""
        userImageUrl = nil
    }

    init(name: String, userImageUrl: URL?) {

        self.name = name
        self.userImageUrl = userImageUrl
    }

    init(user: GitHubUser) {

        name = user.name
        userImageUrl = user.avatarUrl
    }
}
