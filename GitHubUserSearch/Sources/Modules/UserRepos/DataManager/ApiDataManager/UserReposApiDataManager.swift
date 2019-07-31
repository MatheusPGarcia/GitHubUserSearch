//
//  UserReposApiDataManager.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 29/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

final class UserReposApiDataManager { }

// MARK: - UserReposApiDataManager
extension UserReposApiDataManager: UserReposApiDataManagerProtocol {

    func requestReposForUser(_ user: String,
                             completion: @escaping (Result<[Repo], Error>) -> Void) {

        let provider = gitHubProvider
        let target = GitHubProvider.repos(user)

        RequestManager.request(provider: provider,
                               target: target,
                               type: [Repo].self) { (result) in

            switch result {
            case .success(let reposResponse):

                completion(.success(reposResponse))
            case .failure(let error):

                completion(.failure(error))
            }
        }
    }
}
