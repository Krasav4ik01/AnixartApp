//
//  NotificationTableViewCell.swift
//  Anixart
//
//  Created by Rustem on 09.12.2022.
//

import UIKit
import SnapKit
class NotificationTableViewCell: UITableViewCell {
    
    lazy var circleImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "\(GenerateAnimeData().getAnimeImages().randomElement() ?? "chainsawman")" )
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 50
        
        return imageView
    }()
    
    var episodCount: Int = 1
    var studio = "Studio Band"
    lazy var reliseLabel: UILabel = {
       let label = UILabel()
        label.text = "Вышла \(GenerateAnimeData().getAnimeEpisodeCounts().randomElement() ?? "1") серия \(GenerateAnimeData().getAnimeName().randomElement() ?? "s") в варианте \(studio)"
        label.textColor = MainTabBarController().selectedItemColor
        return label
    }()
    
    lazy var notifDate: UILabel = {
       let label = UILabel()
        label.text = GenerateAnimeData().getAnimeDates().randomElement()
        label.font = UIFont(name: "Arial", size: 15)
        label.textColor = MainTabBarController().defaultItemColor
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor =  MainTabBarController().defaultDarkTheme

//        contentView.backgroundColor = .systemOrange
//        contentView.layer.cornerRadius = 7
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension NotificationTableViewCell{
    func setupViews(){
        contentView.addSubview(circleImage)
        contentView.addSubview(reliseLabel)
        contentView.addSubview(notifDate)
    }
    func setupConstraints(){
        circleImage.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalTo(60)
            
        }
        reliseLabel.snp.makeConstraints { make in
            make.leading.equalTo(circleImage.snp.trailing).offset(20)
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        notifDate.snp.makeConstraints { make in
            make.top.equalTo(reliseLabel.snp.bottom).offset(20)
            make.leading.equalTo(circleImage.snp.trailing).offset(20)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
    }
}
