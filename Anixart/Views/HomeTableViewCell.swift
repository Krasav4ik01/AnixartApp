//
//  HomeTableViewCell.swift
//  Anixart
//
//  Created by Rustem on 11.11.2022.
//

import UIKit
import SnapKit

class HomeTableViewCell: UITableViewCell {
    
    lazy var invisibleButton: UIButton = {
       let button = UIButton()
        button.addTarget(self, action: #selector(targetPage), for: .touchUpInside)
        return button
    }()
    
    @objc func targetPage(){
        print("Next page tupped")
        let animePage = AnimeViewController()
//        self.pushViewController(animePage, animated: true)
        MainTabBarController().navigationController?.pushViewController(animePage, animated: true)
    }
    
    
    
    lazy var animeImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "\(GenerateAnimeData().getAnimeImages().randomElement() ?? "chainsawman")" )
//        imageView.image = UIImage(named: "chainsawman.jpg")
        imageView.contentMode = .scaleAspectFit
//        imageView.autoSetDimensions(to: CGSize(width: 128.0, height: 128.0))
        imageView.layer.cornerRadius = 20
        
//        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var animeTitle: UILabel = {
       let label = UILabel()
        label.text = GenerateAnimeData().getAnimeName().randomElement()
        label.textColor = MainTabBarController().selectedItemColor
        return label
    }()
    
    lazy var animeEpisodeCounts: UILabel = {
       let label = UILabel()
        label.text = GenerateAnimeData().getAnimeEpisodes().randomElement()
        label.textColor = MainTabBarController().selectedItemColor
        return label
    }()
    
    lazy var animeRatingCounts: UILabel = {
       let label = UILabel()
        label.text = GenerateAnimeData().getAnimeRates().randomElement()
        label.textColor = MainTabBarController().selectedItemColor
        return label
    }()
    
    lazy var animeDescription: UILabel = {
       let label = UILabel()
        label.text = GenerateAnimeData().getAnimeDesc().randomElement()
        label.textColor = MainTabBarController().selectedItemColor
        label.layer.cornerRadius = 6
        return label
    }()
    
//    lazy var cellSettings: UIImageView = {
//       let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "poweroutlet.type.l.fill")
//        imageView.contentMode = .scaleAspectFit
//        imageView.tintColor = .label
////        imageView.autoSetDimensions(to: CGSize(width: 128.0, height: 128.0))
////        imageView.layer.cornerRadius = 20
//
//        imageView.clipsToBounds = true
//        return imageView
//    }()
    
    lazy var cellSettingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "poweroutlet.type.l.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        
        button.tintColor = .label
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(cellSettingsButtonTupped(sender:)), for: .touchUpInside)
        return button
        
    }()
    @objc private func cellSettingsButtonTupped(sender: UIButton){
        print("cellSettingsButtonTupped")
        self.animateView(sender)
    }
    
    func animateView(_ viewToAnimate: UIView){
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        } ) {(_) in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.2, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
            
        }
    }
    
    
    

    
    
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


extension HomeTableViewCell: AnimeManagerDelegate{
    func didUpdateAnime(_ animeManager: AnimeManager, with model: AnimeModel) {
        DispatchQueue.main.async {
            self.animeTitle.text = model.title
            self.animeDescription.text = model.desc
            self.animeEpisodeCounts.text = "\(Int(model.episodes))"
            self.animeRatingCounts.text = "\(Int(model.rate))"
        }
        
    }
    
    func didFailWithError(with: Error) {
        print("Errrrroooor!")
    }
    
    
}



private extension HomeTableViewCell{
    func setupViews(){
        contentView.addSubview(invisibleButton)
        contentView.addSubview(animeImage)
        contentView.addSubview(animeTitle)
        contentView.addSubview(animeEpisodeCounts)
        contentView.addSubview(animeRatingCounts)
        contentView.addSubview(animeDescription)
        contentView.addSubview(cellSettingsButton)
    }
    func setupConstraints(){
        invisibleButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
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
            make.trailing.equalToSuperview().inset(20)
            
        }
        cellSettingsButton.snp.makeConstraints { make in
//            make.leading.equalTo(topAnimeEpisodeCounts.snp.trailing).offset(50)
            make.trailing.equalToSuperview().inset(5)
//            make.top.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
}


