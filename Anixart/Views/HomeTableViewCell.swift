//
//  HomeTableViewCell.swift
//  Anixart
//
//  Created by Rustem on 11.11.2022.
//

import UIKit
import SnapKit
class HomeTableViewCell: UITableViewCell {
    
    lazy var animeImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "chainsawman.jpg")
        imageView.contentMode = .scaleAspectFit
//        imageView.autoSetDimensions(to: CGSize(width: 128.0, height: 128.0))
        imageView.layer.cornerRadius = 20
        
//        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var animeTitle: UILabel = {
       let label = UILabel()
        label.text = "Название аниме"
        label.textColor = MainTabBarController().selectedItemColor
        return label
    }()
    
    lazy var animeEpisodeCounts: UILabel = {
       let label = UILabel()
        label.text = "8 из 12 эп •"
        label.textColor = MainTabBarController().selectedItemColor
        return label
    }()
    
    lazy var animeRatingCounts: UILabel = {
       let label = UILabel()
        label.text = " 4.9☆"
        label.textColor = MainTabBarController().selectedItemColor
        return label
    }()
    
    lazy var animeDescription: UILabel = {
       let label = UILabel()
        label.text = "Описание"
        label.textColor = MainTabBarController().selectedItemColor
        label.layer.cornerRadius = 6
        return label
    }()
    
    lazy var cellSettings: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "poweroutlet.type.l.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .label
//        imageView.autoSetDimensions(to: CGSize(width: 128.0, height: 128.0))
//        imageView.layer.cornerRadius = 20
        
        imageView.clipsToBounds = true
        return imageView
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

private extension HomeTableViewCell{
    func setupViews(){
        contentView.addSubview(animeImage)
        contentView.addSubview(animeTitle)
        contentView.addSubview(animeEpisodeCounts)
        contentView.addSubview(animeRatingCounts)
        contentView.addSubview(animeDescription)
        contentView.addSubview(cellSettings)
    }
    func setupConstraints(){
        animeImage.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(5)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(100)
        }
        
        animeTitle.snp.makeConstraints { make in
//            make.edges.equalToSuperview().inset(50)
            make.leading.equalTo(animeImage.snp.trailing).offset(20)
//            make.top.equalToSuperview().inset(40)
            make.height.equalToSuperview().multipliedBy(0.3)
//            make.trailing.equalToSuperview().offset(70)
        }
        
        animeEpisodeCounts.snp.makeConstraints { make in
            make.top.equalTo(animeTitle.snp.bottom)
            make.leading.equalTo(animeImage.snp.trailing).offset(20)
//            make.trailing.equalToSuperview().inset(50)
            
        }
        animeRatingCounts.snp.makeConstraints { make in
            make.top.equalTo(animeTitle.snp.bottom)
            make.leading.equalTo(animeEpisodeCounts.snp.trailing)
//            make.trailing.equalToSuperview().inset(50)
        }
        animeDescription.snp.makeConstraints { make in
            make.top.equalTo(animeEpisodeCounts.snp.bottom).offset(15)
            make.leading.equalTo(animeImage.snp.trailing).offset(20)
            
        }
        cellSettings.snp.makeConstraints { make in
//            make.leading.equalTo(topAnimeEpisodeCounts.snp.trailing).offset(50)
            make.trailing.equalToSuperview().inset(5)
//            make.top.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
}
