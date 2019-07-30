//
//  UserReposViewController.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 29/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import UIKit

final class UserReposViewController: UIViewController {

    var presenter: UserReposViewToPresenterProtocol?
}

// MARK: - UserReposPresenterToViewProtocol
extension UserReposViewController: UserReposPresenterToViewProtocol { }
