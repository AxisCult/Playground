//
//  ListContactGroupCell.swift
//  Interview
//
//  Created by Aleksandr on 13.12.2020.
//

import UIKit

protocol ListContactGroupCellDelegate: AnyObject {
    func editContactGroup(from cell: ListContactGroupCell, contactGroupId: String)
}

class ListContactGroupCell: UITableViewCell {
    static let id = "ListContactGroupCell"
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let editButton = UIButton()
    var contactGroupId: String?
    var delegate: ListContactGroupCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(editButton)
        editButton.addTarget(self, action: #selector(actionEdit), for: .touchUpInside)
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func makeConstraints() {
        // Constraints boilerplate
    }

    @objc private func actionEdit() {
        guard let contactGroupId = contactGroupId else { return }
        delegate?.editContactGroup(from: self, contactGroupId: contactGroupId)
    }
}
