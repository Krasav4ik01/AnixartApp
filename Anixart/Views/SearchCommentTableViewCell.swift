//
//  SearchCommentTableViewCell.swift
//  Anixart
//
//  Created by Rustem on 02.12.2022.
//

import UIKit
import SnapKit

class SearchCommentTableViewCell: UITableViewCell {
    
    lazy var topAnimeImages: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "\(GenerateAnimeData().getAnimeImages().randomElement() ?? "chainsawman")" )
        imageView.contentMode = .scaleAspectFit
//        imageView.autoSetDimensions(to: CGSize(width: 128.0, height: 128.0))
        imageView.layer.cornerRadius = 20
        
        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var topAnimeTitle: UILabel = {
       let label = UILabel()
        label.text = GenerateAnimeData().getAnimeName().randomElement()
        label.textColor = MainTabBarController().selectedItemColor
        return label
    }()
    
    lazy var topAnimeEpisodeCounts: UILabel = {
       let label = UILabel()
        label.text = GenerateAnimeData().getAnimeEpisodes().randomElement()
        label.textColor = MainTabBarController().selectedItemColor
        return label
    }()
    
    lazy var topAnimeRatingCounts: UILabel = {
       let label = UILabel()
        label.text = GenerateAnimeData().getAnimeRates().randomElement()
        label.textColor = MainTabBarController().selectedItemColor
        return label
    }()
    
    lazy var topAnimeCommentCounts: UILabel = {
       let label = UILabel()
        label.text = GenerateAnimeData().getAnimeComments().randomElement()
        label.textColor = MainTabBarController().selectedItemColor
        label.layer.backgroundColor = CGColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1)
        label.layer.cornerRadius = 6
        return label
    }()
    
    lazy var cellSettingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "poweroutlet.type.l.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        
        button.tintColor = .label
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(cellSettingsButtonTupped(sender: )), for: .touchUpInside)
        return button
        
    }()
    @objc private func cellSettingsButtonTupped(sender: UIButton){
        print("cellSettingsButtonTupped in SearchTableView")
        HomeTableViewCell().animateView(sender)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor =  MainTabBarController().defaultDarkTheme


        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
private extension SearchCommentTableViewCell{
    func setupViews(){
        contentView.addSubview(topAnimeImages)
        contentView.addSubview(topAnimeTitle)
        contentView.addSubview(topAnimeEpisodeCounts)
        contentView.addSubview(topAnimeRatingCounts)
        contentView.addSubview(topAnimeCommentCounts)
        contentView.addSubview(cellSettingsButton)
    }
    func setupConstraints(){
        
        topAnimeImages.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(5)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(100)
        }
        
        topAnimeTitle.snp.makeConstraints { make in
//            make.edges.equalToSuperview().inset(50)
            make.leading.equalTo(topAnimeImages.snp.trailing).offset(20)
//            make.top.equalToSuperview().inset(40)
            make.height.equalToSuperview().multipliedBy(0.3)
//            make.trailing.equalToSuperview().offset(70)
        }
        
        topAnimeEpisodeCounts.snp.makeConstraints { make in
            make.top.equalTo(topAnimeTitle.snp.bottom)
            make.leading.equalTo(topAnimeImages.snp.trailing).offset(20)
//            make.trailing.equalToSuperview().inset(50)
            
        }
        topAnimeRatingCounts.snp.makeConstraints { make in
            make.top.equalTo(topAnimeTitle.snp.bottom)
            make.leading.equalTo(topAnimeEpisodeCounts.snp.trailing)
//            make.trailing.equalToSuperview().inset(50)
        }
        topAnimeCommentCounts.snp.makeConstraints { make in
            make.top.equalTo(topAnimeEpisodeCounts.snp.bottom).offset(15)
            make.leading.equalTo(topAnimeImages.snp.trailing).offset(20)
            
        }
        cellSettingsButton.snp.makeConstraints { make in
//            make.leading.equalTo(topAnimeEpisodeCounts.snp.trailing).offset(50)
            make.trailing.equalToSuperview().inset(5)
            make.top.equalToSuperview()
            make.height.equalTo(100)
        }
    }
}
