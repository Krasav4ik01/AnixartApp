//
//  SettingsViewController.swift
//  Anixart
//
//  Created by Rustem on 09.12.2022.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    
    lazy var darkOrLightTheme: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "moon.stars")
        
        imageView.tintColor = MainTabBarController().selectedItemColor
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    lazy var settings: UILabel = {
        let label = UILabel()
        label.text = "Темная тема"
        label.font = UIFont(name: "Arial", size: 20)
        label.textColor = MainTabBarController().selectedItemColor
        
        return label
    }()
    
    lazy var darkOrLightButton: UISwitch = {
       let switcher = UISwitch()
        
        switcher.tintColor = MainTabBarController().selectedItemColor
        switcher.onTintColor = MainTabBarController().selectedItemColor
        switcher.isOn = true
        switcher.addTarget(self, action: #selector(changeTheme(sender:)), for: .valueChanged)
        return switcher
    }()
    
    @objc func changeTheme(sender: UISwitch){
        if sender.isOn{
            view.backgroundColor = MainTabBarController().dark
            
            MainTabBarController().view.backgroundColor = MainTabBarController().dark
            
            view.reloadInputViews()
        }
        else{
            view.backgroundColor = MainTabBarController().light
//
//            MainTabBarController().changeTnemeColor()
            MainTabBarController().dark = MainTabBarController().light

            
            view.reloadInputViews()
            darkOrLightButton.isOn = false
        }
    }
    
    
    lazy var notificationImage: UIImageView = {
      let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bell")
        imageView.tintColor = MainTabBarController().selectedItemColor
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
   lazy var notificationLabel: UILabel = {
       let label = UILabel()
        label.text = "Уведомления"
        label.font = UIFont(name: "Arial", size: 20)
        label.textColor = MainTabBarController().selectedItemColor
        return label
    }()
    
    lazy var notificationButton: UISwitch = {
       let switcher = UISwitch()
        
        switcher.tintColor = MainTabBarController().selectedItemColor
        switcher.onTintColor = MainTabBarController().selectedItemColor
        
        switcher.addTarget(self, action: #selector(disableNotification(sender:)), for: .valueChanged)
        return switcher
    }()
    
    
    @objc func disableNotification(sender: UISwitch){
        if sender.isOn {
            print("Notification anabled!")
        }
        else{
            print("Notification disabled!")
        }
        
    }
    
    var segmentedControl: UISegmentedControl = {
       let segmentedControl = UISegmentedControl(items: ["Темная", "Светлая"])
        segmentedControl.backgroundColor = .white
        segmentedControl.selectedSegmentTintColor = MainTabBarController().selectedItemColor
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = UIColor(named: "otherColor")
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    
    @objc func segmentChanged(){
        MTUserDefaults.shared.theme = Theme(rawValue: segmentedControl.selectedSegmentIndex) ?? .dark
        view.window?.overrideUserInterfaceStyle = MTUserDefaults.shared.theme.getUserInterfaceStyle()
    }
//    var tableView: UITableView = {
//       let tableView = UITableView()
//        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.SettingsTableViewCell)
//
//        tableView.backgroundColor = MainTabBarController().dark
//        tableView.showsVerticalScrollIndicator = false
//        return tableView
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Настройки"
        self.navigationController?.navigationBar.tintColor = MainTabBarController().selectedItemColor
        
        setupViews()
        setupConstraints()
        
        segmentedControl.selectedSegmentIndex = MTUserDefaults.shared.theme.rawValue
        
//        tableView.delegate = self
//        tableView.dataSource = self

        view.backgroundColor = MainTabBarController().dark

    }
    
    func setupViews(){
        view.addSubview(darkOrLightTheme)
        view.addSubview(settings)
//        view.addSubview(darkOrLightButton)
        view.addSubview(segmentedControl)
        
        view.addSubview(notificationImage)
        view.addSubview(notificationLabel)
        view.addSubview(notificationButton)
//        view.addSubview(segmentedControl)
//        view.addSubview(tableView)
    }
    func setupConstraints(){
        darkOrLightTheme.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.equalToSuperview().inset(20)
//            make.trailing.equalToSuperview().inset(100)
            
        }
        settings.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.equalTo(darkOrLightTheme.snp.trailing).offset(20)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(15)
            
//            make.leading.equalTo(settings.snp.trailing).offset(40)
            make.trailing.equalToSuperview().inset(10)
            
        }
        
        
        notificationImage.snp.makeConstraints { make in
            make.top.equalTo(settings.snp.bottom).offset(25)
            make.leading.equalToSuperview().inset(20)
        }
        notificationLabel.snp.makeConstraints { make in
            make.top.equalTo(settings.snp.bottom).offset(25)
            make.leading.equalTo(notificationImage.snp.trailing).offset(20)
        }
        notificationButton.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            
//            make.leading.equalTo(settings.snp.trailing).offset(40)
            make.trailing.equalToSuperview().inset(10)
            
        }
//        segmentedControl.snp.makeConstraints { make in
//            make.top.equalTo(notificationButton.snp.bottom).offset(10)
//            make.trailing.equalToSuperview().inset(10)
//        }
//
//        tableView.snp.makeConstraints { make in
//            make.top.equalTo(notificationLabel.snp.bottom).offset(50)
//            make.leading.trailing.bottom.equalToSuperview()
//        }
    }
    
    
    
    
    
    func setDarkTheme(){
        
    }
    
   

}
//extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        20
//    }
//
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.SettingsTableViewCell, for: indexPath) as! SettingsTableViewCell
//            cell.backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1)
//            cell.layer.borderWidth = 1
//            return cell
//        }
//
//
//}
