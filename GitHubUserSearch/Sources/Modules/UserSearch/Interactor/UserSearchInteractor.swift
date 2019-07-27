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

    var users = [GitHubUser]()
}

// MARK: - UserSearchPresenterToInteractorProtocol
extension UserSearchInteractor: UserSearchPresenterToInteractorProtocol {

    func searchForUser(_ user: String) {

        #warning("needs to handle page")
        apiDataManager?.searchForUser(user, page: 0) { [weak self] result in

            switch result {
            case .success(let users):

                self?.users = users
                self?.presenter?.updateUsers()
            case .failure(let error):

                self?.presenter?.handleError(error)
            }
        }
    }
}
