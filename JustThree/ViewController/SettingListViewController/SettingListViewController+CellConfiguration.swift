//
//  SettingListViewController+CellConfiguration.swift
//  JustThree
//
//  Created by Sanghun Park on 03.10.22.
//

import UIKit

extension SettingListViewController {
    
    func defaultConfiguration(for cell: UICollectionViewListCell, at row: Row) -> UIListContentConfiguration {
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = row.name
        contentConfig.textProperties.font = UIFont.preferredFont(forTextStyle: row.textStyle)
        contentConfig.image = row.image
        return contentConfig
    }
    
    func headerConfiguration(for cell: UICollectionViewListCell, with title: String) -> UIListContentConfiguration {
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = title
        return contentConfig
    }
    
    func versionConfiguration(for cell: UICollectionViewListCell, with version: String, at row: Row) -> UIListContentConfiguration {
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = row.name
        contentConfig.secondaryText = version
        contentConfig.textProperties.font = UIFont.preferredFont(forTextStyle: row.textStyle)
        contentConfig.image = row.image
        return contentConfig
    }
}
