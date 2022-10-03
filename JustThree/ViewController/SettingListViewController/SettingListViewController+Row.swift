//
//  SettingListViewController+Row.swift
//  JustThree
//
//  Created by Sanghun Park on 03.10.22.
//

import UIKit

extension SettingListViewController {
    enum Row: Hashable {
        case header(String)
        
        //General
        case dataSync
        
        //Themes
        case themeMode
        case gradientSelection
        
        //ProjectInfo
        case description
        case feedback
        case support
        
        //MoreInfo
        case contact
        case buymeacoffee
        
        var name: String {
            switch self {
            case .dataSync: return "Data Sync"
                
            case .themeMode: return "Theme Mode"
            case .gradientSelection: return "Gradient Color"
                
            case .description: return "Description"
            case .feedback: return "Feedback"
            case .support: return "Support"
                
            case .contact: return "Contact"
            case .buymeacoffee: return "Buy me a coffee"
                
            default: return ""
            }
        }
        
        var imageName: String? {
            switch self {
            case .dataSync: return "tray"
                
            case .themeMode: return "circle.righthalf.filled"
            case .gradientSelection: return "paintpalette"
                
            case .description: return "doc.plaintext"
            case .feedback: return "square.and.pencil"
            case .support: return "questionmark.circle"
                
            case .contact: return "mail"
            case .buymeacoffee: return "cup.and.saucer.fill"
                
            default: return nil
            }
        }
        
        var image: UIImage? {
            guard let imageName = imageName else { return nil }
            let configuration = UIImage.SymbolConfiguration(textStyle: .headline)
            return UIImage(systemName: imageName, withConfiguration: configuration)
        }
        
        var textStyle: UIFont.TextStyle {
            return .subheadline
        }
    }
}
