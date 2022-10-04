//
//  SettingListViewController+DataSource.swift
//  JustThree
//
//  Created by Sanghun Park on 03.10.22.
//

import UIKit

extension SettingListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Row>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Row>
    
    private func cellRegistration() -> UICollectionView.CellRegistration<UICollectionViewListCell, Row> {
        return .init { (cell: UICollectionViewListCell, indexPath: IndexPath, row: Row) in
            
            let section = self.section(for: indexPath)
            switch (section, row) {
            case (_, .header(let title)):
                cell.contentConfiguration = self.headerConfiguration(for: cell, with: title)
            case (_, .version):
                let appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.9"
                cell.contentConfiguration = self.versionConfiguration(for: cell, with: appVersion, at: row)
            default:
                cell.contentConfiguration = self.defaultConfiguration(for: cell, at: row)
            }
            cell.tintColor = .justThreePrimaryTint
        }
    }
    
    func makeDataSource() -> DataSource {
        let cellRegistration = cellRegistration()
        let dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Row) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        return dataSource
    }
    
    func updateSnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([
            //.general,
            //.themes,
            .projectInfo,
            //.moreInfo,
        ])
        /*
        snapshot.appendItems([
            .header(Section.general.name),
            //.dataSync,
            //.pageTransition,
            //.singleWave,
        ], toSection: .general)
        
        snapshot.appendItems([
            .header(Section.themes.name),
            //.themeMode,
            //.gradientSelection,
        ], toSection: .themes)
        */
        snapshot.appendItems([
            .header(Section.projectInfo.name),
            .description,
            //.feedback,
            .support,
            .repository,
            .version,
        ], toSection: .projectInfo)
        /*
        snapshot.appendItems([
            .header(Section.moreInfo.name),
            //.contact,
            //.buymeacoffee,
        ], toSection: .moreInfo)
        */
        dataSource.apply(snapshot)
    }
    
    private func section(for indexPath: IndexPath) -> Section {
        let sectionNumber = indexPath.section
        guard let section = Section(rawValue: sectionNumber) else {
            fatalError("Unable to find matching section")
        }
        return section
    }
}
