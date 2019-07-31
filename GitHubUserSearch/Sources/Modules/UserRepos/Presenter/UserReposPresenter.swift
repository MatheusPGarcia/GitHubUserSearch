//
//  UserReposPresenter.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 29/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

final class UserReposPresenter {

    weak var view: UserReposPresenterToViewProtocol?
    var interactor: UserReposPresenterToInteractorProtocol?
    var router: UserReposPresenterToRouterProtocol?

    private var user: String

    init(user: String) {

        self.user = user
    }
}

// MARK: - UserReposViewToPresenterProtocol
extension UserReposPresenter: UserReposViewToPresenterProtocol {

    func viewDidLoad() {

        view?.startLoading()
        interactor?.askReposForUser(user)
    }

    func getUserName() -> String {

        return user
    }

    func numberOfCells() -> Int {

        return interactor?.getReposCount() ?? 0
    }

    func getRepoViewModel(at indexPath: IndexPath) -> RepoViewModel {

        var viewModel = RepoViewModel()

        if let repo = interactor?.getRepo(atIndex: indexPath.row) {

            viewModel = RepoViewModel(repo: repo)
        }

        return viewModel
    }

    func cellSelected(_ cellName: String) {

        let repos = interactor?.getRepos()
        let repo = repos?.first(where: { $0.name == cellName })

        guard let url = URL(string: repo?.url ?? "") else { return }

        view?.openUrl(url)
    }
}

// MARK: - UserReposInteractorToPresenterProtocol
extension UserReposPresenter: UserReposInteractorToPresenterProtocol {

    func updateUserRepos() {

        view?.stopLoading()
        view?.setReposList()
    }

    func handleError(_ error: Error) {

        view?.presentErrorAlert(title: ":(", message: String.defaultErrorMessage)
    }
}
