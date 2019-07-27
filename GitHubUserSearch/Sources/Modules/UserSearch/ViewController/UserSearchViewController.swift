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

    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var sendButton: UIButton!
}

// MARK: - Actions
extension UserSearchViewController {

    @IBAction func searchWasPressed(_ sender: UIButton) {

        let userName = inputTextField.text

        presenter?.searchForUser(userName)
    }
}

// MARK: - UserSearchPresenterToViewControllerProtocol
extension UserSearchViewController: UserSearchPresenterToViewProtocol {

    func startLoading() {

        print("view started loading")
        #warning("needs implementation")
    }

    func stopLoading() {

        print("view stoped loading")
        #warning("needs implementation")
    }

    func presentErrorMessage(_ message: String) {

        print("view presented error message: \(message)")
        #warning("needs implementation")
    }
}
