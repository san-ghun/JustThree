//
//  ReminderViewController+CellConfiguration.swift
//  JustThree
//
//  Created by Sanghun Park on 26.09.22.
//

import UIKit

extension ReminderViewController {
    
    func defaultConfiguration(for cell: UICollectionViewListCell, at row: Row) -> UIListContentConfiguration {
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = self.text(for: row)
        contentConfig.textProperties.font = UIFont.preferredFont(forTextStyle: row.textStyle)
        contentConfig.image = row.image
        return contentConfig
    }
    
    func headerConfiguration(for cell: UICollectionViewListCell, with title: String) -> UIListContentConfiguration {
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = title
        return contentConfig
    }
    
    private func text(for row: Row) -> String? {
        switch row {
        case .viewDate: return reminder.dueDate.dayText
        case .viewNotes: return reminder.notes
        case .viewTime: return reminder.dueDate.formatted(date: .omitted, time: .shortened)
        case .viewTitle: return reminder.title
        default: return nil
        }
    }
    
}
