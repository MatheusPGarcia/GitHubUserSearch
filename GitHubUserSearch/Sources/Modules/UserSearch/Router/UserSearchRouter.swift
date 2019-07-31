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
extension UserSearchRouter: UserSearchPresenterToRouterProtocol {

    func presentRepos(from navController: UINavigationController, forUser user: String) {

        let storyboard = UIStoryboard(name: "UserRepos", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "UserReposViewController")
        guard let userReposController = controller as? UserReposViewController else { return }

        UserReposRouter.createUserReposModule(withViewController: userReposController,
                                              forUser: user)

        navController.pushViewController(controller, animated: true)
        //view.present(controller, animated: true, completion: nil)
    }
}
