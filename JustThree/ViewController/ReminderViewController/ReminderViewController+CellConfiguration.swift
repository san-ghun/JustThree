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
    
    func titleConfiguration(for cell: UICollectionViewListCell, with title: String?) -> TextFieldContentView.Configuration {
        var contentConfig = cell.textFieldConfiguration()
        contentConfig.text = title
        contentConfig.onChange = { [weak self] title in
            self?.workingReminder.title = title
        }
        return contentConfig
    }
    
    func dateConfiguration(for cell: UICollectionViewListCell, with date: Date) -> DatePickerContentView.Configuration {
        var contentConfig = cell.datePickerConfiguration()
        contentConfig.date = date
        return contentConfig
    }
    
    func notesConfiguration(for cell: UICollectionViewListCell, with notes: String?) -> TextViewContentView.Configuration {
        var contentConfig = cell.textViewConfiguration()
        contentConfig.text = notes
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
