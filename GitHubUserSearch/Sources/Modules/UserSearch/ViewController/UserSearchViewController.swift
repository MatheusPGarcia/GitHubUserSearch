//
//  UserSearchViewController.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import UIKit

final class UserSearchViewController: UIViewController {

    var presenter: UserSearchViewToPresenterProtocol?
}

// MARK: - UserSearchPresenterToViewControllerProtocol
extension UserSearchViewController: UserSearchPresenterToViewProtocol { }
