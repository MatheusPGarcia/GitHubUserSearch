//
//  UserSearchPresenter.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

final class UserSearchPresenter {

    weak var view: UserSearchPresenterToViewProtocol?
    var interactor: UserSearchPresenterToInteractorProtocol?
    var router: UserSearchPresenterToRouterProtocol?
}

// MARK: - UserSearchViewControllerToPresenterProtocol
extension UserSearchPresenter: UserSearchViewToPresenterProtocol {

    func searchForUser(_ userName: String?) {

        guard let userName = userName, !userName.isEmpty else {

            view?.presentErrorMessage(String.emptySearchMessage)
            return
        }

        view?.startLoading()
        interactor?.searchForUser(userName)
    }

    func numberOfCells() -> Int {

        let usersCount = interactor?.getUsersCount() ?? 0

        if usersCount == 0 {

            view?.setEmptyState()
        }
        return usersCount
    }
}

// MARK: - UserSearchInteractorToPresenterProtocol
extension UserSearchPresenter: UserSearchInteractorToPresenterProtocol {

    func updateUsers() {

        #warning("needs implementation")
    }

    func handleError(_ error: Error) {

        #warning("needs implementation")
    }
}
