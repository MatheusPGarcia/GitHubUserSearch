//
//  UserSearchProtocols.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

// MARK: - UserSearchViewToPresenterProtocol
// VIEW -> PRESENTER
protocol UserSearchViewToPresenterProtocol: class {

    func searchForUser(_ user: String?)

    func numberOfCells() -> Int
}

// MARK: - UserSearchPresenterToViewProtocol
// PRESENTER -> VIEW
protocol UserSearchPresenterToViewProtocol: class {

    func setEmptyState()

    func startLoading()

    func stopLoading()

    func presentErrorMessage(_ message: String)
}

// MARK: - UserSearchPresenterToInteractorProtocol
// PRESENTER -> INTERACTOR
protocol UserSearchPresenterToInteractorProtocol: class {

    func getUsersCount() -> Int
    
    func searchForUser(_ user: String)

    func requestMoreResultsForUser(_ user: String)
}

// MARK: - UserSearchInteractorToPresenterProtocol
// INTERACTOR -> PRESENTER
protocol UserSearchInteractorToPresenterProtocol: class {

    func updateUsers()

    func handleError(_ error: Error)
}

// MARK: - UserSearchLocalDataManagerProtocol
// INTERACTOR -> LOCALDATAMANAGER
protocol UserSearchLocalDataManagerProtocol: class { }

// MARK: - UserSearchApiDataManagerProtocol
// INTERACTOR -> APIDATAMANAGER
protocol UserSearchApiDataManagerProtocol: class {

    func searchForUser(_ user: String,
                       page: Int,
                       completion: @escaping (Swift.Result<UsersResponse, Error>) -> Void)
}

// MARK: - UserSearchPresenterToRouterProtocol
// PRESENTER -> ROUTER
protocol UserSearchPresenterToRouterProtocol: class { }
