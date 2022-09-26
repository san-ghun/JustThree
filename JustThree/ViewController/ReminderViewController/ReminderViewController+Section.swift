//
//  ReminderViewController+Section.swift
//  JustThree
//
//  Created by Sanghun Park on 26.09.22.
//

import Foundation

extension ReminderViewController {
    enum Section: Int, Hashable {
        case view
        case notes
        case date
        case title
        
        var name: String {
            switch self {
            case .view: return ""
            case .notes:
                return NSLocalizedString("Notes", comment: "Notes section name")
            case .date:
                return NSLocalizedString("Date", comment: "Date section name")
            case .title:
                return NSLocalizedString("Title", comment: "Title section name")
            }
        }
    }
}
