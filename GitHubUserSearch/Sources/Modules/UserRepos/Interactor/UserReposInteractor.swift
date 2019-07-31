//
//  UserReposInteractor.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 29/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

final class UserReposInteractor {

    weak var presenter: UserReposInteractorToPresenterProtocol?
    var apiDataManager: UserReposApiDataManagerProtocol?
    var localDataManager: UserReposLocalDataManagerProtocol?

    var repos = [Repo]()
}

// MARK: - UserReposPresenterToInteractorProtocol
extension UserReposInteractor: UserReposPresenterToInteractorProtocol {

    func askReposForUser(_ user: String) {

        apiDataManager?.requestReposForUser(user) { [weak self] (result) in

            switch result {
            case .success(let repos):

                self?.repos = repos
                self?.presenter?.updateUserRepos()
            case .failure(let error):

                self?.presenter?.handleError(error)
            }
        }
    }

    func getReposCount() -> Int {

        return repos.count
    }

    func getRepo(atIndex index: Int) -> Repo? {

        return repos[safe: index]
    }

    func getRepos() -> [Repo] {

        return repos
    }
}
