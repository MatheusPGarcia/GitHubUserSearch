//
//  UserReposViewController.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 29/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import UIKit

final class UserReposViewController: UIViewController {

    @IBOutlet private weak var reposTableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var presenter: UserReposViewToPresenterProtocol?

    // MARK: - Life Cycle
    override func viewDidLoad() {

        super.viewDidLoad()

        setupViews()

        presenter?.viewDidLoad()
    }

    // MARK: - Setup
    private func setupViews() {

        extendedLayoutIncludesOpaqueBars = true

        setupNavigationBar()
        setupTableView()
    }

    private func setupNavigationBar() {

        navigationItem.title = presenter?.getUserName()

        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .mainColor
        navigationController?.navigationBar.isTranslucent = false
    }

    private func setupTableView() {

        reposTableView.register(RepoCell.self, forCellReuseIdentifier: RepoCell.cellIdentifier)
        reposTableView.dataSource = self
    }
}

// MARK: - UserReposPresenterToViewProtocol
extension UserReposViewController: UserReposPresenterToViewProtocol {

    func setReposList() {

        reposTableView.reloadData()
    }

    func startLoading() {

        activityIndicator.startAnimating()

        loadingView.alpha = 0
        loadingView.isHidden = false

        let animation = UIViewPropertyAnimator(duration: 0.30, curve: .linear) {

            self.loadingView.alpha = 1
        }

        animation.startAnimation()
    }

    func stopLoading() {

        let animation = UIViewPropertyAnimator(duration: 0.30, curve: .linear) {

            self.loadingView.alpha = 0
        }

        animation.addCompletion { [weak self] _ in

            self?.loadingView.isHidden = true
            self?.activityIndicator.stopAnimating()
        }

        animation.startAnimation()
    }

    func openUrl(_ url: URL) {

        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    func presentErrorAlert(title: String, message: String) {

        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertAction.Style.default,
                                      handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource
extension UserReposViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return presenter?.numberOfCells() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = UITableViewCell()

        if let repoCell = tableView.dequeueReusableCell(withIdentifier: RepoCell.cellIdentifier,
                                                        for: indexPath) as? RepoCell,
            let viewModel = presenter?.getRepoViewModel(at: indexPath) {

            repoCell.setupCell(withViewModel: viewModel)
            repoCell.delegate = self
            cell = repoCell
        }

        return cell
    }
}

// MARK: - RepoCellDelegate
extension UserReposViewController: RepoCellDelegate {

    func repoTitleInteraction(for repoName: String) {

        presenter?.cellSelected(repoName)
    }
}
