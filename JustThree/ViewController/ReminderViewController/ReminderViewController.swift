//
//  ReminderViewController.swift
//  JustThree
//
//  Created by Sanghun Park on 26.09.22.
//

import UIKit

//private let reuseIdentifier = "Cell"

class ReminderViewController: UICollectionViewController {
    private typealias DataSource = UICollectionViewDiffableDataSource<Int, Row>
    
    var reminder: Reminder
    private lazy var dataSource: DataSource = makeDataSource()
    
    init(reminder: Reminder) {
        self.reminder = reminder
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.showsSeparators = false
        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        super.init(collectionViewLayout: listLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellRegistration() -> UICollectionView.CellRegistration<UICollectionViewListCell, Row> {
        return .init { (cell: UICollectionViewListCell, indexPath: IndexPath, row: Row) in
            
            var contentConfig = cell.defaultContentConfiguration()
            contentConfig.text = self.text(for: row)
            contentConfig.textProperties.font = UIFont.preferredFont(forTextStyle: row.textStyle)
            contentConfig.image = row.image
            cell.contentConfiguration = contentConfig
            cell.tintColor = .justThreePrimaryTint
        }
    }
    
    private func makeDataSource() -> DataSource {
        let cellRegistration = cellRegistration()
        return DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Row) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
    }
    
    func text(for row: Row) -> String? {
        switch row {
        case .viewDate: return reminder.dueDate.dayText
        case .viewNotes: return reminder.notes
        case .viewTime: return reminder.dueDate.formatted(date: .omitted, time: .shortened)
        case .viewTitle: return reminder.title
        }
    }
    
}
