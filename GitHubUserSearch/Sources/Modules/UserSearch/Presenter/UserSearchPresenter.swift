//
//  UserSearchPresenter.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import Foundation

final class UserSearchPresenter {

    weak var viewController: UserSearchPresenterToViewProtocol?
    var interactor: UserSearchPresenterToInteractorProtocol?
    var router: UserSearchPresenterToRouterProtocol?
}

// MARK: - UserSearchViewControllerToPresenterProtocol
extension UserSearchPresenter: UserSearchViewToPresenterProtocol { }

// MARK: - UserSearchInteractorToPresenterProtocol
extension UserSearchPresenter: UserSearchInteractorToPresenterProtocol { }
