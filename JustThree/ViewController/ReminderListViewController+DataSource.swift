//
//  ReminderListViewController+DataSource.swift
//  JustThree
//
//  Created by Sanghun Park on 26.09.22.
//

import UIKit

extension ReminderListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    func reminderCellRegistration() -> UICollectionView.CellRegistration<UICollectionViewListCell, String> {
        return .init { cell, indexPath, itemIdentifier in
            let reminder = Reminder.sampleData[indexPath.item]
            
            var contentConfig = cell.defaultContentConfiguration()
            contentConfig.text = reminder.title
            contentConfig.textProperties.color = .darkGray
            contentConfig.secondaryText = reminder.dueDate.dayAndTimeText
            contentConfig.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
            cell.contentConfiguration = contentConfig
            
            var backgroundConfig = UIBackgroundConfiguration.listGroupedCell()
            backgroundConfig.backgroundColor = .justThreeListCellBackground
            backgroundConfig.cornerRadius = 8
            cell.backgroundConfiguration = backgroundConfig
        }
    }
}
