//
//  SearchViewController.swift
//  Anixart
//
//  Created by Rustem on 11.11.2022.
//

import UIKit
import SnapKit
class SearchViewController: UIViewController {
    
    
    
    
    lazy private var topTableView: UICollectionView = {
//    let collectionView = UICollectionView()
        let layout = UICollectionViewFlowLayout ()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize (width: 430, height: 350)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout : layout)
        collectionView.backgroundColor = .clear
        collectionView.register (SearchTableViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.searchTableViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy private var searchTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(SearchCommentTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.SearchCommentTableViewCell)
        tableView.backgroundColor = MainTabBarController().defaultDarkTheme
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        topTableView.dataSource = self
        topTableView.delegate = self
        
        searchTableView.dataSource = self
        searchTableView.delegate = self
        
        
        setupViews()
        setupConstraints()
    }
    


}


private extension SearchViewController {
    func setupViews(){
       view.addSubview(topTableView)
        view.addSubview(searchTableView)
        
    }
    func setupConstraints(){
       
        topTableView.snp.makeConstraints { make in
//           make.edges.equalToSuperview().inset(10)
            make.top.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.4)
       }
        searchTableView.snp.makeConstraints { make in
            make.top.equalTo(topTableView.snp.bottom).offset(10)
//            make.top.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
 
}


extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.searchTableViewCell, for: indexPath)
        return cell
    }
    
    
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.SearchCommentTableViewCell, for: indexPath)
//        cell.textLabel?.text = "Label"
//        return cell
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.SearchCommentTableViewCell, for: indexPath) as! SearchCommentTableViewCell
            cell.backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1)
            cell.layer.borderWidth = 1
            return cell
        }
    
}
