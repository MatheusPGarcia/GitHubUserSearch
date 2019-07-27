//
//  UserSearchInteractor.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

final class UserSearchInteractor {

    weak var presenter: UserSearchInteractorToPresenterProtocol?
    var apiDataManager: UserSearchApiDataManagerProtocol?
    var localDataManager: UserSearchLocalDataManagerProtocol?

    var currentPage: Int = 0
    var currentSearchResultsCount: Int = 0

    var users = [GitHubUser]()
}

// MARK: - UserSearchPresenterToInteractorProtocol
extension UserSearchInteractor: UserSearchPresenterToInteractorProtocol {

    func getUsersCount() -> Int {

        return users.count
    }

    func searchForUser(_ user: String) {

        currentPage = 1

        makeUserRequest(user: user,
                        page: currentPage) { [weak self] (result) in

            switch result {
            case .success(let usersResponse):

                self?.currentSearchResultsCount = usersResponse.usersCount
                self?.users = usersResponse.users
                self?.presenter?.updateUsers()
            case .failure(let error):

                self?.presenter?.handleError(error)
            }
        }
    }

    func requestMoreResultsForUser(_ user: String) {

        currentPage += 1

        #warning("verify if it is possible to ask for more users")

        makeUserRequest(user: user, page: currentPage) { [weak self] (result) in

            switch result {
            case .success(let usersResponse):

                self?.users.append(contentsOf: usersResponse.users)
                self?.presenter?.updateUsers()
            case .failure(let error):

                self?.presenter?.handleError(error)
            }
        }
    }
}

// MARK: - Private methods
extension UserSearchInteractor {

    private func makeUserRequest(user: String,
                                 page: Int,
                                 completion: @escaping (Swift.Result<UsersResponse, Error>) -> Void) {

        apiDataManager?.searchForUser(user, page: page, completion: completion)
    }
}

private enum Constants {

    static let usersPerPage: Int = 100
    static let gitHubResponseLimit: Int = 1000
}
