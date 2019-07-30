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
extension UserReposPresenter: UserReposViewToPresenterProtocol { }

// MARK: - UserReposInteractorToPresenterProtocol
extension UserReposPresenter: UserReposInteractorToPresenterProtocol { }
