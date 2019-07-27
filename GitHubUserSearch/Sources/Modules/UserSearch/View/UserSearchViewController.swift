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

    // MARK: - Life Cycle
    override func viewDidLoad() {

        setupSearchBar()
    }

    // MARK: - Setup
    private func setupSearchBar() {

        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = String.searchPlaceHolder

        if let view = searchBar.value(forKey: "searchField") as? UITextView {

            view.backgroundColor = UIColor.init(red: 63/255, green: 68/255, blue: 72/255, alpha: 1)
        }

        self.navigationItem.titleView = searchBar
    }
}

// MARK: - Actions
extension UserSearchViewController {

    @IBAction func searchWasPressed(_ sender: UIButton) {

        presenter?.searchForUser("")
    }
}

// MARK: - UserSearchPresenterToViewControllerProtocol
extension UserSearchViewController: UserSearchPresenterToViewProtocol {

    func setEmptyState() {

        print("view setted in empty state")
        #warning("needs implementation")
    }

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

// MARK: - UITableViewDataSource
extension UserSearchViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return presenter?.numberOfCells() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        #warning("needs Implementation")
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension UserSearchViewController: UITableViewDelegate {

}
