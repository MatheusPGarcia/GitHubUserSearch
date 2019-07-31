//
//  UserSearchApiDataManager.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

final class UserSearchApiDataManager {

    private var requesting: Bool = false
}

// MARK: - UserSearchApiDataManagerProtocol
extension UserSearchApiDataManager: UserSearchApiDataManagerProtocol {

    func searchForUser(_ user: String,
                       page: Int,
                       completion: @escaping (Result<UsersResponse, Error>) -> Void) {

        guard !requesting else { return }
        requesting = true

        let provider = gitHubProvider
        let target = GitHubProvider.user(user, page: page)

        RequestManager.request(provider: provider,
                               target: target,
                               type: UsersResponse.self) { [weak self] (result) in

            self?.requesting = false

            switch result {
            case .success(let usersResponse):

                completion(.success(usersResponse))
            case .failure(let error):

                completion(.failure(error))
            }
        }
    }
}
