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
protocol UserReposViewToPresenterProtocol: class { }

// MARK: - UserReposPresenterToViewProtocol
// PRESENTER -> VIEW
protocol UserReposPresenterToViewProtocol: class { }

// MARK: - UserReposPresenterToInteractorProtocol
// PRESENTER -> INTERACTOR
protocol UserReposPresenterToInteractorProtocol: class { }

// MARK: - UserReposInteractorToPresenterProtocol
// INTERACTOR -> PRESENTER
protocol UserReposInteractorToPresenterProtocol: class { }

// MARK: - UserReposLocalDataManagerProtocol
// INTERACTOR -> LOCALDATAMANAGER
protocol UserReposLocalDataManagerProtocol: class { }

// MARK: - UserReposApiDataManagerProtocol
// INTERACTOR -> APIDATAMANAGER
protocol UserReposApiDataManagerProtocol: class { }

// MARK: - UserReposPresenterToRouterProtocol
// PRESENTER -> ROUTER
protocol UserReposPresenterToRouterProtocol: class { }
