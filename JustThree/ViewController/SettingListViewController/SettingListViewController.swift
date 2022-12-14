//
//  SettingListViewController.swift
//  JustThree
//
//  Created by Sanghun Park on 23.09.22.
//

import UIKit

class SettingListViewController: UICollectionViewController {
    
    lazy var dataSource: DataSource = makeDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        collectionView.backgroundColor = .systemGroupedBackground
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        navigationItem.title = NSLocalizedString("Settings", comment: "Settings view controller title")
        navigationController?.navigationBar.prefersLargeTitles = true
        
        updateSnapshot()
        
        collectionView.dataSource = dataSource
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = true
        listConfiguration.headerMode = .firstItemInSection
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
    private func showDescription() {
        let note: String = """
        \"JustThree\" is made for my own needs.
        
        I added too many reminders and todos everyday. And, I couldn't finish up everything, on most days. I needed to reduce or limit my reminders and todos, for my own good.
        
        With just three reminders and todos, I could improve my productivity and my focus. I no longer distracted or worry too much about the fear that I will not accomplish my day.
        
        I wish all the users, who use this little app, to be more happy, productive, and achieve.
        
        And for those users who are young and growing, might get distracted and lose focus frequently, keep up and stick to the most important just three things todo for your best today.
        
        Good Luck!
        """
        let reminder = Reminder(title: "Just Three - Description", dueDate: Date.now, notes: note, isComplete: false)
        let viewController = ReminderViewController(reminder: reminder) { [weak self] reminder in }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}


extension SettingListViewController {
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    /*
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }
    */

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let sectionNumber = indexPath.section
        
        //Section: .general
        
        //Section: .themes
        
        //Section: .projectInfo
        if indexPath.description == "[\(sectionNumber), 1]" {
            showDescription()
        }
        else if indexPath.description == "[\(sectionNumber), 2]" {
            let support = "https://san-ghun.github.io/JustThree/"
            if let url = URL(string: support) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        else if indexPath.description == "[\(sectionNumber), 3]" {
            let repository = "https://github.com/san-ghun/JustThree/"
            if let url = URL(string: repository) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        //Section: .moreInfo
        else if indexPath.description == "[\(sectionNumber+1), 1]" {
            let email = "po4865@gmail.com"
            if let url = URL(string: "mailto:\(email)") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        return false
    }
    
    /*
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.description)
    }
    */
    
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
