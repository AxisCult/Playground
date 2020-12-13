//
//  ListViewController.swift
//  Interview
//
//  Created by Aleksandr on 13.12.2020.
//

import UIKit

class ListViewController: UIViewController {

    private let tableView = UITableView()
    private var viewModels: [ListViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListButtonCell.self, forCellReuseIdentifier: ListButtonCell.id)
        tableView.register(ListContactCell.self, forCellReuseIdentifier: ListContactCell.id)
        tableView.register(ListContactGroupCell.self, forCellReuseIdentifier: ListContactGroupCell.id)
        makeConstraints()
    }

    private func makeConstraints() {
        // Constraints boilerplate
    }
}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        viewModels.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels[section].cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModels[indexPath.section].cells[indexPath.row]
        switch model {
        case .button(let buttonType):
            let cell = tableView.dequeueReusableCell(withIdentifier: ListButtonCell.id, for: indexPath) as! ListButtonCell
            cell.titleLabel.text = buttonType.title
            cell.titleLabel.textColor = buttonType.color
            cell.titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
            return cell
        case .contact(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: ListContactCell.id, for: indexPath) as! ListContactCell
            cell.titleLabel.text = model.title
            cell.subtitleLabel.text = model.subtitle
            if let url = model.avatarUrl {
                DispatchQueue.global(qos: .userInteractive).async {
                    let image = UIImage(data: try! Data(contentsOf: url))
                    DispatchQueue.main.async {
                        cell.avatarImageView.image = image
                    }
                }
            }
            return cell
        case .contactGroup(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: ListContactGroupCell.id, for: indexPath) as! ListContactGroupCell
            cell.titleLabel.text = model.title
            cell.subtitleLabel.text = model.subtitle
            cell.editButton.isHidden = model.isEditable == false
            cell.contactGroupId = model.id
            cell.delegate = self
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let retval = UILabel()
        retval.text = viewModels[section].sectionTitle
        return retval
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        24
    }
}

// MARK: - UITableViewDelegate
extension ListViewController: ListContactGroupCellDelegate {

    func editContactGroup(from cell: ListContactGroupCell, contactGroupId: String) {

        // TODO: implement
    }
}
