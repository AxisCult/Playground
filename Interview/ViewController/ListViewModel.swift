//
//  ListViewModel.swift
//  Interview
//
//  Created by Aleksandr on 13.12.2020.
//

import UIKit

struct ListViewModel {

    let sectionTitle: String
    let cells: [Cell]

    enum Cell {
        case button(ButtonType)
        case contact(ContactModel)
        case contactGroup(ContactGroupModel)
    }

    enum ButtonType {
        case add
        case contactsPermission

        var title: String {
            switch self {
            case .add:
                return "Add new"
            case .contactsPermission:
                return "Enable contact access"
            }
        }
        var color: UIColor {
            switch self {
            case .add:
                return .blue
            case .contactsPermission:
                return .red
            }
        }
    }

    struct ContactModel {
        let title: String
        let subtitle: String
        let avatarUrl: URL?
    }

    struct ContactGroupModel {
        let id: String
        let title: String
        let subtitle: String
        let isEditable: Bool
    }
}
