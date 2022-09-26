//
//  ReminderListViewController+DataSource.swift
//  JustThree
//
//  Created by Sanghun Park on 26.09.22.
//

import UIKit

extension ReminderListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Reminder.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Reminder.ID>
    
    func reminderCellRegistration() -> UICollectionView.CellRegistration<UICollectionViewListCell, String> {
        return .init { (cell: UICollectionViewListCell, indexPath: IndexPath, id: Reminder.ID) in
            let reminder = self.reminder(for: id)
            
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
    
    func updateSnapshot(reloading ids: [Reminder.ID] = []) {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(reminders.map { $0.id })
        if !ids.isEmpty {
            snapshot.reloadItems(ids)
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    
    func completeReminder(with id: Reminder.ID) {
        var reminder = reminder(for: id)
        reminder.isComplete.toggle()
        update(reminder, with: id)
        updateSnapshot(reloading: [id])
    }
    
    private func doneButtonConfiguration(for reminder: Reminder) -> UICellAccessory.CustomViewConfiguration {
        let symbolName = reminder.isComplete ? "circle.fill" : "circle"
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        let button = ReminderDoneButton()
        button.addTarget(self, action: #selector(didPressDoneButton(_:)), for: .touchUpInside)
        button.id = reminder.id
        button.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
    }
    
    func reminder(for id: Reminder.ID) -> Reminder {
        let index = reminders.indexOfReminder(with: id)
        return reminders[index]
    }
    
    func update(_ reminder: Reminder, with id: Reminder.ID) {
        let index = reminders.indexOfReminder(with: id)
        reminders[index] = reminder
    }
}
