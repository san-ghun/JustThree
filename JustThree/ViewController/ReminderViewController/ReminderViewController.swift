//
//  ReminderViewController.swift
//  JustThree
//
//  Created by Sanghun Park on 26.09.22.
//

import UIKit

//private let reuseIdentifier = "Cell"

class ReminderViewController: UICollectionViewController {
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Row>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Row>

    
    var reminder: Reminder
    private lazy var dataSource: DataSource = makeDataSource()
    
    init(reminder: Reminder) {
        self.reminder = reminder
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.showsSeparators = false
        listConfiguration.headerMode = .firstItemInSection
        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        super.init(collectionViewLayout: listLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = NSLocalizedString("Reminder", comment: "Reminder view controller title")
        navigationItem.rightBarButtonItem = editButtonItem
        
        updateSnapshotForViewing()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing {
            updateSnapshotForEditing()
        }
        else {
            updateSnapshotForViewing()
        }
    }
    
    func cellRegistration() -> UICollectionView.CellRegistration<UICollectionViewListCell, Row> {
        return .init { (cell: UICollectionViewListCell, indexPath: IndexPath, row: Row) in
            
            let section = self.section(for: indexPath)
            switch (section, row) {
            case (_, .header(let title)):
                cell.contentConfiguration = self.headerConfiguration(for: cell, with: title)
            case (.view, _):
                cell.contentConfiguration = self.defaultConfiguration(for: cell, at: row)
            default:
                fatalError("Unexpected combination of section and row.")
            }
            cell.tintColor = .justThreePrimaryTint
        }
    }
    
    private func makeDataSource() -> DataSource {
        let cellRegistration = cellRegistration()
        return DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Row) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
    }
    
    private func updateSnapshotForEditing() {
        var snapshot = Snapshot()
        snapshot.appendSections([.title, .date, .notes])
        snapshot.appendItems([.header(Section.title.name)], toSection: .title)
        snapshot.appendItems([.header(Section.date.name)], toSection: .date)
        snapshot.appendItems([.header(Section.notes.name)], toSection: .notes)
        dataSource.apply(snapshot)
    }
    
    private func updateSnapshotForViewing() {
        var snapshot = Snapshot()
        snapshot.appendSections([.view])
        snapshot.appendItems([.header(""), .viewTitle, .viewDate, .viewTime, .viewNotes], toSection: .view)
        dataSource.apply(snapshot)
    }
    
    private func section(for indexPath: IndexPath) -> Section {
        let sectionNumber = isEditing ? indexPath.section + 1 : indexPath.section
        guard let section = Section(rawValue: sectionNumber) else {
            fatalError("Unable to find matching section")
        }
        return section
    }
    
}
