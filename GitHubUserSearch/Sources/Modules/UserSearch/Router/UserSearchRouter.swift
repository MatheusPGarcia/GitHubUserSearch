//
//  UserSearchRouter.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import UIKit

class UserSearchRouter {

    static func createUserSearchModule(withViewController view: UserSearchViewController?) {

        let presenter = UserSearchPresenter()
        let router = UserSearchRouter()
        let interactor = UserSearchInteractor()
        let apiDataManager = UserSearchApiDataManager()
        let localDataManager = UserSearchLocalDataManager()

        view?.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.apiDataManager = apiDataManager
        interactor.localDataManager = localDataManager
    }
}

// MARK: - UserSearchPresenterToRouterProtocol
extension UserSearchRouter: UserSearchPresenterToRouterProtocol { }
