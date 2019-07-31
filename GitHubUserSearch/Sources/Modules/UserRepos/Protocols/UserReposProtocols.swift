//
//  UserReposProtocols.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 29/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

// MARK: - UserReposViewToPresenterProtocol
// VIEW -> PRESENTER
protocol UserReposViewToPresenterProtocol: class {

    func viewDidLoad()

    func getUserName() -> String

    func cellSelected(_ cellName: String)

    // MARK: TableViewDataSource
    func numberOfCells() -> Int

    func getRepoViewModel(at indexPath: IndexPath) -> RepoViewModel
}

// MARK: - UserReposPresenterToViewProtocol
// PRESENTER -> VIEW
protocol UserReposPresenterToViewProtocol: class {

    func setReposList()

    func startLoading()

    func stopLoading()

    func openUrl(_ url: URL)

    func presentErrorAlert(title: String, message: String)
}

// MARK: - UserReposPresenterToInteractorProtocol
// PRESENTER -> INTERACTOR
protocol UserReposPresenterToInteractorProtocol: class {

    func askReposForUser(_ user: String)

    func getReposCount() -> Int

    func getRepo(atIndex index: Int) -> Repo?

    func getRepos() -> [Repo]
}

// MARK: - UserReposInteractorToPresenterProtocol
// INTERACTOR -> PRESENTER
protocol UserReposInteractorToPresenterProtocol: class {

    func updateUserRepos()

    func handleError(_ error: Error)
}

// MARK: - UserReposLocalDataManagerProtocol
// INTERACTOR -> LOCALDATAMANAGER
protocol UserReposLocalDataManagerProtocol: class { }

// MARK: - UserReposApiDataManagerProtocol
// INTERACTOR -> APIDATAMANAGER
protocol UserReposApiDataManagerProtocol: class {

    func requestReposForUser(_ user: String,
                             completion: @escaping (Swift.Result<[Repo], Error>) -> Void)
}

// MARK: - UserReposPresenterToRouterProtocol
// PRESENTER -> ROUTER
protocol UserReposPresenterToRouterProtocol: class { }
