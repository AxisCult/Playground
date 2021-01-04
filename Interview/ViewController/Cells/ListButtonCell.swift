//
//  ListButtonCell.swift
//  Interview
//
//  Created by Aleksandr on 13.12.2020.
//

import UIKit

class ListButtonCell: UITableViewCell {
    static let id = "ListButtonCell"
    let titleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(titleLabel)
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func makeConstraints() {
        // Constraints boilerplate
    }
}
