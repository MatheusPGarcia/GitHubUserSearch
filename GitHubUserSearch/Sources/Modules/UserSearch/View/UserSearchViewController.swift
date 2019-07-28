//
//  UserSearchViewController.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import UIKit

final class UserSearchViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    var presenter: UserSearchViewToPresenterProtocol?

    // MARK: - Life Cycle
    override func viewDidLoad() {

        setupNavigationBar()
        setupSearchBar()
        setupTableView()
    }

    // MARK: - Setup
    private func setupNavigationBar() {

        navigationController?.navigationBar.barTintColor = .mainColor
        navigationController?.navigationBar.isTranslucent = false
    }

    private func setupSearchBar() {

        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = String.searchPlaceHolder

        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {

            textfield.textColor = UIColor.white
            if let backgroundview = textfield.subviews.first {

                backgroundview.backgroundColor = UIColor.clearGrayColor

                backgroundview.layer.cornerRadius = 10
                backgroundview.clipsToBounds = true
            }
        }

        searchBar.delegate = self

        self.navigationItem.titleView = searchBar
    }

    private func setupTableView() {

        tableView.register(UserProfileCell.self,
                           forCellReuseIdentifier: UserProfileCell.cellIdentifier)

        tableView.dataSource = self
        tableView.delegate = self

        tableView.keyboardDismissMode = .onDrag
    }
}

// MARK: - Private methods
extension UserSearchViewController {

    private func hideKeyboard(usingView view: UIView) {

        view.endEditing(true)
    }
}

// MARK: - Actions
extension UserSearchViewController { }

// MARK: - UserSearchPresenterToViewControllerProtocol
extension UserSearchViewController: UserSearchPresenterToViewProtocol {

    func setEmptyState() {

        print("view setted in empty state")
        #warning("needs implementation")
    }

    func updateUsersList() {

        tableView.reloadData()
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

        var cell = UITableViewCell()

        if let userCell = tableView.dequeueReusableCell(withIdentifier: UserProfileCell.cellIdentifier,
                                                        for: indexPath) as? UserProfileCell,
            let viewModel = presenter?.getUserViewModel(at: indexPath) {

            userCell.setupCell(withViewModel: viewModel)
            cell = userCell
        }

        return cell
    }
}

// MARK: - UITableViewDelegate
extension UserSearchViewController: UITableViewDelegate {

}

// MARK: - UISearchBarDelegate
extension UserSearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        hideKeyboard(usingView: searchBar)

        let user = searchBar.text
        presenter?.searchForUser(user)
    }
}
