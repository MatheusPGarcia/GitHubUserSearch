//
//  UserProfileCell.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 28/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import UIKit
import Kingfisher

class UserProfileCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var userImageView: UIImageView!

    static let cellIdentifier = "UserProfileCell"

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
        customView = Bundle.main.loadNibNamed("UserProfileCell", owner: self, options: nil)?.first as? UIView
        guard customView != nil else { return }
        customView?.backgroundColor = .clear
        customView?.frame = self.bounds
        customView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(customView!)
        selectionStyle = .none
    }

    // MARK: - Setup Cell
    func setupCell(withViewModel viewModel: UserViewModel) {

        nameLabel.text = viewModel.name
        userImageView.kf.setImage(with: viewModel.userImageUrl)
    }
}
