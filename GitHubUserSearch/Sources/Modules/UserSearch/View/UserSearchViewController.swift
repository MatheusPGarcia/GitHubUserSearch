//
//  UserSearchViewController.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import UIKit

private enum SearchViewStates {

    case emptyState
    case presentingList
    case error
}

final class UserSearchViewController: UIViewController {

    @IBOutlet private weak var usersTableView: UITableView!
    @IBOutlet private weak var emptyStateView: UIView!
    @IBOutlet private weak var errorView: UIView!
    @IBOutlet private weak var loadingView: UIView!
    @IBOutlet private weak var loadingActivityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var errorMessageLabel: UILabel!

    var presenter: UserSearchViewToPresenterProtocol?

    // MARK: - Life Cycle
    override func viewDidLoad() {

        setupViews()
    }

    // MARK: - Setup
    private func setupViews() {

        setupNavigationBar()
        setupSearchBar()
        setupTableView()

        stopLoading()
        setEmptyState()
    }

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

        usersTableView.register(UserProfileCell.self,
                           forCellReuseIdentifier: UserProfileCell.cellIdentifier)

        usersTableView.dataSource = self
        usersTableView.delegate = self

        usersTableView.keyboardDismissMode = .onDrag
    }
}

// MARK: - Private methods
extension UserSearchViewController {

    private func hideKeyboard(usingView view: UIView) {

        view.endEditing(true)
    }

    private func updateViewStatus(toState state: SearchViewStates) {

        var showView: UIView
        var hideViews = [UIView]()

        switch state {
        case .emptyState:

            showView = emptyStateView
            hideViews.append(contentsOf: [errorView, usersTableView])
        case .presentingList:

            showView = usersTableView
            hideViews.append(contentsOf: [emptyStateView, errorView])
        case .error:

            showView = errorView
            hideViews.append(contentsOf: [emptyStateView, usersTableView])
        }

        animateViewStatusUpdate(showView: showView, hideViews: hideViews)
    }
}

// MARK: - Actions
extension UserSearchViewController { }

// MARK: - Animations
extension UserSearchViewController {

    private func animateViewStatusUpdate(showView: UIView, hideViews: [UIView]) {

        let hideAnimation = UIViewPropertyAnimator(duration: 0.15, curve: .linear) {

            hideViews.forEach { $0.alpha = 0 }
        }

        let presenteAnimation = UIViewPropertyAnimator(duration: 0.15, curve: .linear) {

            showView.alpha = 1
        }

        hideAnimation.addCompletion { _ in

            hideViews.forEach { $0.isHidden = true }

            showView.alpha = 0
            showView.isHidden = false

            presenteAnimation.startAnimation()
        }

        hideAnimation.startAnimation()
    }
}

// MARK: - UserSearchPresenterToViewControllerProtocol
extension UserSearchViewController: UserSearchPresenterToViewProtocol {

    func setEmptyState() {

        updateViewStatus(toState: .emptyState)
    }

    func setUsersList() {

        usersTableView.reloadData()

        updateViewStatus(toState: .presentingList)
    }

    func startLoading() {

        loadingActivityIndicator.startAnimating()
        loadingView.isHidden = false
    }

    func stopLoading() {

        loadingView.isHidden = true
        loadingActivityIndicator.stopAnimating()
    }

    func presentErrorMessage(_ message: String) {

        errorMessageLabel.text = message
        updateViewStatus(toState: .error)
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
