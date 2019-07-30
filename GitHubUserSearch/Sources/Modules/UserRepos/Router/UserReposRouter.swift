//
//  UserReposRouter.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 29/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import UIKit

class UserReposRouter {

    static func createUserReposModule(forUser user: String) -> UIViewController? {

        let view = UserReposViewController()
        let presenter = UserReposPresenter(user: user)
        let router = UserReposRouter()
        let interactor = UserReposInteractor()
        let apiDataManager = UserReposApiDataManager()
        let localDataManager = UserReposLocalDataManager()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.apiDataManager = apiDataManager
        interactor.localDataManager = localDataManager

        return view
    }
}

// MARK: - UserReposPresenterToRouterProtocol
extension UserReposRouter: UserReposPresenterToRouterProtocol { }
