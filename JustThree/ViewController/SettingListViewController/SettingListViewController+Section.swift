//
//  SettingListViewController+Section.swift
//  JustThree
//
//  Created by Sanghun Park on 03.10.22.
//

import Foundation

extension SettingListViewController {
    enum Section: Int, Hashable {
        case general
        case themes
        case projectInfo
        case moreInfo
        
        var name: String {
            switch self {
            case .general:
                return NSLocalizedString("General", comment: "General section name")
            case .themes:
                return NSLocalizedString("Themes", comment: "Themes section name")
            case .projectInfo:
                return NSLocalizedString("Project Info", comment: "Project information section name")
            case .moreInfo:
                return NSLocalizedString("More Info", comment: "More information section name")
            }
        }
        
    }
}
