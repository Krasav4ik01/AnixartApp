//
//  NotificationViewController.swift
//  Anixart
//
//  Created by Rustem on 09.12.2022.
//

import UIKit
import SnapKit
class NotificationViewController: UIViewController {
    
    lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.NotificationTableViewCell)
        tableView.backgroundColor = MainTabBarController().dark
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Уведомления"
        self.navigationController?.navigationBar.tintColor = MainTabBarController().selectedItemColor
        view.backgroundColor = MainTabBarController().dark
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupViews()
        setupConstartints()
    }
    
    func setupViews(){
        view.addSubview(tableView)
    }
    
    func setupConstartints(){
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
extension NotificationViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.NotificationTableViewCell, for: indexPath) as! NotificationTableViewCell
            cell.backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1)
            cell.layer.borderWidth = 1
            return cell
        }
    
    
}
