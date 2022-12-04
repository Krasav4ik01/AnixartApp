//
//  MainTabBarController.swift
//  Anixart
//
//  Created by Rustem on 11.11.2022.
//

import UIKit
import SnapKit
final class MainTabBarController: UITabBarController {
    
//    lazy private var searchBar: UISearchBar = {
//       let searchBar = UISearchBar()
//        searchBar.placeholder = "  Поиск аниме"
////        searchBar.barTintColor = UIColor.black
//        searchBar.contentMode = .scaleAspectFill
//        searchBar.layer.cornerRadius = 25
//        searchBar.tintColor = .systemBackground
//        searchBar.sizeToFit()
//        searchBar.layer.borderWidth = 1
//        return searchBar
//    }()
    var filteredAnime = [AnimeLists]()
    let anime = AnimeLists.GetAnime()
    lazy var navigationBar: UIView = {
       let navBar = UIView()
        return navBar
    }()
    public let defaultItemColor = UIColor(red: 107/255, green: 107/255, blue: 107/255, alpha: 1)
    public let selectedItemColor = UIColor(red: 201/255, green: 201/255, blue: 201/255, alpha: 1)
    public let defaultBarBarDarkColor = UIColor(red: 37/255, green: 37/255, blue: 37/255, alpha: 1)
    public let defaultDarkTheme = UIColor(red: 43/255, green: 43/255, blue: 46/255, alpha: 1)
    
    lazy var searchController: UISearchController = {
        let results = UISearchController()
        results.view.backgroundColor = defaultDarkTheme
       let searchBar = UISearchController(searchResultsController: results)
//        searchBar.searchResultsUpdater = self
        searchBar.obscuresBackgroundDuringPresentation = false
        searchBar.searchBar.placeholder = "   Поиск аниме"
        searchBar.searchBar.tintColor = .white
        searchBar.searchBar.barTintColor = .white
//        searchBar.searchBar.backgroundColor = defaultBarBarDarkColor
        searchBar.searchBar.layer.cornerRadius = 30
        searchBar.searchBar.sizeToFit()
        searchBar.searchBar.searchBarStyle = .minimal
        searchBar.definesPresentationContext = true
        searchBar.searchBar.barTintColor = selectedItemColor
        searchBar.searchBar.translatesAutoresizingMaskIntoConstraints = false
//        searchBar.searchBar.widthAnchor.constraint(equalTo: HomeViewController().tableView.widthAnchor, multiplier: 0.6)
//        searchBar.searchBar.barPosition.rawValue
//        searchBar.searchBar.scopeButtonTitles = ["Все", "Новые", "Анонс"]
        searchBar.searchBar.delegate = self
        return searchBar
    }()
    
    lazy private var settings: UIImageView = {
       let settings = UIImageView()
        settings.image = UIImage(systemName: "gearshape")
        settings.contentMode = .scaleAspectFill
        settings.tintColor = defaultItemColor
        return settings
    }()
    lazy private var notification: UIImageView = {
       let notification = UIImageView()
        notification.image = UIImage(systemName: "bell")
        notification.layer.fillMode = .both
        notification.contentMode = .scaleAspectFill
        notification.tintColor = defaultItemColor
        return notification
    }()
    
   
    
    let home = UINavigationController(rootViewController: HomeViewController())
    let search = UINavigationController(rootViewController: SearchViewController())
    let bookmarks = UINavigationController(rootViewController: BookmarksViewController())
    let profile = UINavigationController(rootViewController: ProfileViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.barTintColor = defaultBarBarDarkColor
        self.tabBar.tintColor = selectedItemColor
        
        self.tabBar.backgroundColor = defaultBarBarDarkColor
        navigationBar.addSubview(searchController.searchBar)
        searchController.hidesNavigationBarDuringPresentation = false
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.searchController = searchController
        
//        tabBar.tintColor = UIColor(red: 43/255, green: 43/255, blue: 46/255, alpha: 1)
//        tabBar.backgroundColor = UIColor(red: 43/255, green: 43/255, blue: 46/255, alpha: 1)
        setupViews()
        setupProperties()
        
    }
    
    func setupViews() {
//        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false
        
//        view.addSubview(searchBar)
        view.addSubview(settings)
        view.addSubview(notification)
        

        setViewControllers([home, search, bookmarks, profile], animated: true)
        
    }
    
    func setupProperties(){
        
//        searcBar.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(50)
//            make.height.equalToSuperview().multipliedBy(0.06)
//            make.leading.equalToSuperview().offset(10)
//            make.trailing.equalToSuperview().multipliedBy(0.68)
////            make.bottom.equalToSuperview().multipliedBy(0.1)
//
//
//        }
//        searchController.searchBar.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(50)
//            make.height.equalToSuperview().multipliedBy(0.06)
//            make.width.equalToSuperview().multipliedBy(0.3)
//            make.leading.equalToSuperview().offset(10)
//            make.trailing.equalToSuperview().multipliedBy(0.68)
//            make.bottom.equalToSuperview().multipliedBy(0.1)
////            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
//            make.width.equalToSuperview().multipliedBy(0.7)
//
//
//        }

//        searchController.searchBar.widthAnchor.constraint(equalTo: HomeViewController().navigationView.widthAnchor, multiplier: 0.7).isActive = true
        
        settings.snp.makeConstraints { make in
//            make.leading.equalTo(searchBar.snp.trailing).offset(25)
//            make.leading.equalTo(searchController.searchBar.snp.trailing).offset(25)
            make.leading.equalToSuperview().offset(25)
            make.top.equalToSuperview().inset(50)
            make.bottom.equalToSuperview().multipliedBy(0.1)
        }
        notification.snp.makeConstraints { make in
            make.leading.equalTo(settings.snp.trailing).offset(40)
            make.top.equalToSuperview().inset(50)
            make.bottom.equalToSuperview().multipliedBy(0.1)
        }
        
        
        home.tabBarItem.image = UIImage(systemName: "house")
        home.title = "Главная"
        search.tabBarItem.image = UIImage(systemName: "safari")
        search.title = "Обзор"
        bookmarks.tabBarItem.image = UIImage(systemName: "bookmark")
        bookmarks.title = "Закладки"
        profile.tabBarItem.image = UIImage(systemName: "person.circle")
        profile.title = "Профиль"
    }

    func filterContentForSearchText(searchText: String, scope:String = "All") {
        filteredAnime = anime.filter({(anime:AnimeLists ) -> Bool in
            let doesCategoryMatch = (scope == "All") || (anime.title == scope)
            if isSearchBarEmpty(){
                return doesCategoryMatch
            }
            else{
                return doesCategoryMatch && anime.title.lowercased().contains(searchText.lowercased())
            }
        })
        HomeViewController().tableView.reloadData()
    }
    
    
    func isSearchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!isSearchBarEmpty() || searchBarScopeIsFiltering)
    }
}


extension MainTabBarController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}
//extension MainTabBarController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        let searchBar = searchController.searchBar
//        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
//        filterContentForSearchText(searchText: searchController.searchBar.text!, scope: scope)
//    }
//}

