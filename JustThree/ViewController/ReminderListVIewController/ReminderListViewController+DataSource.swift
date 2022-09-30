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
    
    var reminderCompletedValue: String {
        NSLocalizedString("Completed", comment: "Reminder completed value")
    }
    var reminderNotCompletedValue: String {
        NSLocalizedString("Not completed", comment: "Reminder not completed value")
    }
    
    private func reminderCellRegistration() -> UICollectionView.CellRegistration<UICollectionViewListCell, Reminder.ID> {
        return .init { (cell: UICollectionViewListCell, indexPath: IndexPath, id: Reminder.ID) in
            let reminder = self.reminder(for: id)
            
            var contentConfig = cell.defaultContentConfiguration()
            contentConfig.text = reminder.title
//            contentConfig.textProperties.color = .darkGray
            contentConfig.secondaryText = reminder.dueDate.dayAndTimeText
            contentConfig.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
            cell.contentConfiguration = contentConfig
            
            var doneButtonConfig = self.doneButtonConfiguration(for: reminder)
            doneButtonConfig.tintColor = .justThreeListCellDoneButtonTint
            cell.accessibilityCustomActions = [ self.doneButtonAccessibilityAction(for: reminder) ]
            cell.accessibilityValue = reminder.isComplete ? self.reminderCompletedValue : self.reminderNotCompletedValue
            cell.accessories = [ .customView(configuration: doneButtonConfig), .disclosureIndicator(displayed: .always) ]
            
            var backgroundConfig = UIBackgroundConfiguration.listGroupedCell()
            backgroundConfig.backgroundColor = .justThreeListCellBackground
//            backgroundConfig.cornerRadius = 8
            cell.backgroundConfiguration = backgroundConfig
        }
    }
    
    private func reminderHeaderRegistration() -> UICollectionView.SupplementaryRegistration<ProgressHeaderView> {
        return .init(elementKind: ProgressHeaderView.elementKind) { (progressView: ProgressHeaderView, elementKind: String, indexPath: IndexPath) in
            self.headerView = progressView
        }
    }
    
    func makeDataSource() -> DataSource {
        let reminderCellRegistration = reminderCellRegistration()
        let reminderHeaderRegistration = reminderHeaderRegistration()
        
        let dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Reminder.ID) in
            return collectionView.dequeueConfiguredReusableCell(using: reminderCellRegistration, for: indexPath, item: itemIdentifier)
        }
        dataSource.supplementaryViewProvider = { supplementaryView, elementKind, indexPath in
            return self.collectionView.dequeueConfiguredReusableSupplementary(using: reminderHeaderRegistration, for: indexPath)
        }
        
        return dataSource
    }
    
    func updateSnapshot(reloading idsChanged: [Reminder.ID] = []) {
        let ids = idsChanged.filter { id in filteredReminders.contains(where: { $0.id == id }) }
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(filteredReminders.map { $0.id })
        if !ids.isEmpty {
            snapshot.reloadItems(ids)
        }
        dataSource.apply(snapshot, animatingDifferences: true)
        headerView?.progress = progress
    }
    
    
    func completeReminder(with id: Reminder.ID) {
        var reminder = reminder(for: id)
        reminder.isComplete.toggle()
        update(reminder, with: id)
        updateSnapshot(reloading: [id])
    }
    
    private func doneButtonAccessibilityAction(for reminder: Reminder) -> UIAccessibilityCustomAction {
        let name = NSLocalizedString("Toggle completion", comment: "Reminder done button accessibility label")
        let action = UIAccessibilityCustomAction(name: name) { [weak self] action in
            self?.completeReminder(with: reminder.id)
            return true
        }
        return action
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
    
    func add(_ reminder: Reminder) {
        reminders.append(reminder)
    }
    
    func deleteReminder(with id: Reminder.ID) {
        let index = reminders.indexOfReminder(with: id)
        reminders.remove(at: index)
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
