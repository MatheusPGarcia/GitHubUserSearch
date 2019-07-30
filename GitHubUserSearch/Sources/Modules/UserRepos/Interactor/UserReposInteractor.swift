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
}

// MARK: - UserReposPresenterToInteractorProtocol
extension UserReposInteractor: UserReposPresenterToInteractorProtocol { }
