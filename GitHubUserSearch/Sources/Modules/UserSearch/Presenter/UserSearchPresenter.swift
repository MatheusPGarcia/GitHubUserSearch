//
//  UserSearchPresenter.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import UIKit

final class UserSearchPresenter {

    weak var view: UserSearchPresenterToViewProtocol?
    var interactor: UserSearchPresenterToInteractorProtocol?
    var router: UserSearchPresenterToRouterProtocol?
}

// MARK: - UserSearchViewControllerToPresenterProtocol
extension UserSearchPresenter: UserSearchViewToPresenterProtocol {

    func searchForUser(_ userName: String?) {

        guard let userName = userName?.trimmingCharacters(in: .whitespaces), !userName.isEmpty else {

            view?.presentErrorMessage(String.emptySearchMessage)
            return
        }

        view?.startLoading()
        interactor?.searchForUser(userName)
    }

    func selectedUser(at indexPath: IndexPath) {

        if let userName = interactor?.getUserAtIndex(indexPath.item)?.name,
            let view = view as? UIViewController,
            let navController = view.navigationController {

            router?.presentRepos(from: navController, forUser: userName)
        }
    }

    func numberOfCells() -> Int {

        let usersCount = interactor?.getUsersCount() ?? 0

        if usersCount == 0 {

            view?.setEmptyState()
        }
        return usersCount
    }

    func getUserViewModel(at indexPath: IndexPath) -> UserViewModel {

        var viewModel = UserViewModel()

        if let user = interactor?.getUserAtIndex(indexPath.item) {

            viewModel = UserViewModel(user: user)
        }

        return viewModel
    }
}

// MARK: - UserSearchInteractorToPresenterProtocol
extension UserSearchPresenter: UserSearchInteractorToPresenterProtocol {

    func updateUsers() {

        view?.stopLoading()

        guard interactor?.getUsersCount() ?? 0 > 0 else {

            view?.presentErrorMessage(String.userNotFounded)
            return
        }

        view?.setUsersList()
    }

    func handleError(_ error: Error) {

        view?.stopLoading()
        view?.presentErrorMessage(String.defaultErrorMessage)
    }
}
