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
}

// MARK: - UserSearchPresenterToInteractorProtocol
extension UserSearchInteractor: UserSearchPresenterToInteractorProtocol { }
