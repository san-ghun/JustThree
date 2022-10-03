//
//  SettingListViewController.swift
//  JustThree
//
//  Created by Sanghun Park on 23.09.22.
//

import UIKit

//private let reuseIdentifier = "Cell"

struct SettingsOption {
    let title: String
    let iconName: String?
    let iconColor: UIColor
    let iconBackgroundColor: UIColor
    let handler: (()->Void)
}

class SettingListViewController: UICollectionViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    lazy var dataSource: DataSource = makeDataSource()
    var models: [SettingsOption] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        collectionView.backgroundColor = .secondarySystemBackground
        
        configureModels()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        navigationItem.title = NSLocalizedString("Settings", comment: "Settings view controller title")
        navigationController?.navigationBar.prefersLargeTitles = true
        
        updateSnapshot()
        
        collectionView.dataSource = dataSource
    }
    
    func configureModels() {
        models.append(
            contentsOf: [
                SettingsOption(title: "ABC", iconName: "gear", iconColor: .white,  iconBackgroundColor: .systemGray) {},
                SettingsOption(title: "Abc", iconName: "house", iconColor: .white,  iconBackgroundColor: .systemGray2) {},
                SettingsOption(title: "aBc", iconName: "circle", iconColor: .white,  iconBackgroundColor: .systemGray3) {},
                SettingsOption(title: "abC", iconName: "circle.fill", iconColor: .white,  iconBackgroundColor: .systemGray4) {},
            ]
        )
        models.append(
            contentsOf: [
                SettingsOption(title: "abc", iconName: "gear", iconColor: .white,  iconBackgroundColor: .systemGray) {},
                SettingsOption(title: "aBC", iconName: "house", iconColor: .white,  iconBackgroundColor: .systemGray2) {},
                SettingsOption(title: "AbC", iconName: "circle", iconColor: .white,  iconBackgroundColor: .systemGray3) {},
                SettingsOption(title: "ABc", iconName: "circle.fill", iconColor: .white,  iconBackgroundColor: .systemGray4) {},
            ]
        )
    }
    
    private func cellRegistration() -> UICollectionView.CellRegistration<UICollectionViewListCell, String> {
        return .init { (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            let model = self.models[indexPath.item]
            
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = model.title
            cell.contentConfiguration = contentConfiguration
            
            let iconConfiguration = self.iconConfiguration(for: model)
            cell.accessories = [ .customView(configuration: iconConfiguration), .disclosureIndicator(displayed: .always) ]
        }
    }
    
    func makeDataSource() -> DataSource {
        let cellRegistration = cellRegistration()
        let dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        return dataSource
    }
    
    func updateSnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(models.map { $0.title })
        dataSource.apply(snapshot)
    }
    
    func iconConfiguration(for settingsOption: SettingsOption) -> UICellAccessory.CustomViewConfiguration {
        let imageName = settingsOption.iconName ?? "gear"
        let imageConfiguration = UIImage.SymbolConfiguration(textStyle: .title1, scale: .default)
        let image = UIImage(systemName: imageName, withConfiguration: imageConfiguration)
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.tintColor = .white//settingsOption.iconColor
        button.backgroundColor = .systemGray//settingsOption.iconBackgroundColor
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = true
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
}

/*
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

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
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
*/
