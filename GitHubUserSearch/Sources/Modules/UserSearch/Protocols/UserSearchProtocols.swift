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
protocol UserSearchViewToPresenterProtocol: class { }

// MARK: - UserSearchPresenterToViewProtocol
// PRESENTER -> VIEW
protocol UserSearchPresenterToViewProtocol: class { }

// MARK: - UserSearchPresenterToInteractorProtocol
// PRESENTER -> INTERACTOR
protocol UserSearchPresenterToInteractorProtocol: class { }

// MARK: - UserSearchInteractorToPresenterProtocol
// INTERACTOR -> PRESENTER
protocol UserSearchInteractorToPresenterProtocol: class { }

// MARK: - UserSearchLocalDataManagerProtocol
// INTERACTOR -> LOCALDATAMANAGER
protocol UserSearchLocalDataManagerProtocol: class { }

// MARK: - UserSearchApiDataManagerProtocol
// INTERACTOR -> APIDATAMANAGER
protocol UserSearchApiDataManagerProtocol: class { }

// MARK: - UserSearchPresenterToRouterProtocol
// PRESENTER -> ROUTER
protocol UserSearchPresenterToRouterProtocol: class { }
