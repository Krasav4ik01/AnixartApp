//
//  HomeViewController.swift
//  Anixart
//
//  Created by Rustem on 11.11.2022.
//

import UIKit
import SnapKit
class HomeViewController: UIViewController {
    
//    private var animeManager = AnimeManager()
    
    lazy var navigationView: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize (width: 125, height: 200)
//        layout.itemSize.width = 125
//        layout.itemSize.height = 300
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout : layout)
        collectionView.backgroundColor = MainTabBarController().dark
        collectionView.register (HomeNavigationTableViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.HomeNavigationTableViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.homeTableViewCell)
        tableView.backgroundColor = MainTabBarController().dark
        tableView.showsVerticalScrollIndicator = false
//                tableView.tableHeaderView = MainTabBarController().searchController.searchBar
        
        return tableView
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()

//        view.backgroundColor = MainTabBarController().dark
        setupViews()
        setupConstraints()
        
        navigationView.dataSource = self
        navigationView.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        if SettingsViewController().darkOrLightButton.isOn == false {
            view.backgroundColor = MainTabBarController().light
        }
        else{
            view.backgroundColor = MainTabBarController().dark
        }
//        animeManager.delegate = tableView as? any AnimeManagerDelegate
//
//        animeManager.fetchRequest()
    }
    
    func setupViews(){
//        navigationItem.searchController = MainTabBarController().searchController
        view.addSubview(navigationView)
        view.addSubview(tableView)
        

    }
    func setupConstraints(){
        navigationView.snp.makeConstraints { make in
//            make.top.equalTo(MainTabBarController().searchBar.snp.bottom)
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview()
//            make.top.leading.trailing.equalToSuperview()

            make.height.equalToSuperview().multipliedBy(0.065)
//            make.bottom.equalToSuperview().offset(30)

        }
//
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
            
//            make.edges.equalToSuperview()
        }
    }
 

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.homeTableViewCell, for: indexPath) as! HomeTableViewCell
            cell.backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1)
            cell.layer.borderWidth = 1
            return cell
        }
    
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.HomeNavigationTableViewCell, for: indexPath)
        return cell
    }
}
