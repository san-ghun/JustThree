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
            
            var doneButtonConfig = self.doneButtonConfiguration(for: reminder)
            doneButtonConfig.tintColor = .justThreeListCellDoneButtonTint
            cell.accessories = [ .customView(configuration: doneButtonConfig), .disclosureIndicator(displayed: .always) ]
            
            var backgroundConfig = UIBackgroundConfiguration.listGroupedCell()
            backgroundConfig.backgroundColor = .justThreeListCellBackground
            backgroundConfig.cornerRadius = 8
            cell.backgroundConfiguration = backgroundConfig
        }
    }
    
    private func doneButtonConfiguration(for reminder: Reminder) -> UICellAccessory.CustomViewConfiguration {
        let symbolName = reminder.isComplete ? "circle.fill" : "circle"
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        let button = UIButton()
        button.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
    }
}
