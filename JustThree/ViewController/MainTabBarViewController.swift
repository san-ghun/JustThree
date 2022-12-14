//
//  MainTabBarViewController.swift
//  JustThree
//
//  Created by Sanghun Park on 23.09.22.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    var vcArray: [UINavigationController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .clear
//        view.backgroundColor = .justThreeGradientFutureBegin
        
        let listLayout = defaultListLayout()
        
//        let vc1 = UINavigationController(rootViewController: ReminderListViewController(collectionViewLayout: listLayout))
//        let vc2 = UINavigationController(rootViewController: ReminderListViewController(collectionViewLayout: listLayout))
        let vc3 = UINavigationController(rootViewController: ReminderListViewController(collectionViewLayout: listLayout))
        let vc4 = UINavigationController(rootViewController: SettingListViewController(collectionViewLayout: listLayout))
        
//        vc1.tabBarItem.image = UIImage(systemName: "die.face.1.fill")
//        vc2.tabBarItem.image = UIImage(systemName: "die.face.2.fill")
        vc3.tabBarItem.image = UIImage(systemName: "die.face.3.fill")
        vc4.tabBarItem.image = UIImage(systemName: "gearshape.fill")
        
//        vc1.title = "Just"
//        vc2.title = "Three"
//        vc3.title = "JustThree"
//        vc4.title = "Setting"
        
        vcArray = [
//            vc1,
//            vc2,
            vc3,
            vc4,
        ]
        
        setViewControllers(vcArray, animated: true)
    }

    private func defaultListLayout() -> UICollectionViewCompositionalLayout {
        
        // Create a section in a list layout
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = true
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }

}

