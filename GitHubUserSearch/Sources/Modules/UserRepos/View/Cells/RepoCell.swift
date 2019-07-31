//
//  RepoCell.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 30/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import UIKit

protocol RepoCellDelegate: class {

    func repoTitleInteraction(for repoName: String)
}

final class RepoCell: UITableViewCell {

    @IBOutlet private weak var nameButton: UIButton!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var starsLabel: UILabel!

    static let cellIdentifier = "RepoCell"

    weak var delegate: RepoCellDelegate?

    // MARK: - Init
    private var customView: UIView?

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        self.loadXib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.loadXib()
    }

    private func loadXib() {
        customView = Bundle.main.loadNibNamed("RepoCell", owner: self, options: nil)?.first as? UIView
        guard customView != nil else { return }
        customView?.backgroundColor = .clear
        customView?.frame = self.bounds
        customView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(customView!)
        selectionStyle = .none
    }

    // MARK: - Setup Cell
    func setupCell(withViewModel viewModel: RepoViewModel) {

        nameButton.setTitle(viewModel.name, for: .normal)
        descriptionLabel.text = viewModel.description
        languageLabel.text = viewModel.language
        starsLabel.text = String(viewModel.stars ?? 0)
    }

    // MARK: - Action
    @IBAction func repoNameSelected(_ sender: Any) {

        guard let repoName = nameButton.titleLabel?.text else { return }
        delegate?.repoTitleInteraction(for: repoName)
    }
}
