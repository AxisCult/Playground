//
//  ListContactCell.swift
//  Interview
//
//  Created by Aleksandr on 13.12.2020.
//

import UIKit

class ListContactCell: UITableViewCell {
    static let id = "ListContactCell"
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let avatarImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(avatarImageView)
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func makeConstraints() {
        // Constraints boilerplate
    }
}
