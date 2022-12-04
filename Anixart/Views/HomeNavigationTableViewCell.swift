//
//  HomeNavigationTableViewCell.swift
//  Anixart
//
//  Created by Rustem on 18.11.2022.
//

import UIKit
import SnapKit

class HomeNavigationTableViewCell: UICollectionViewCell {

  
    lazy var navigationView: UILabel = {
       let label = UILabel()
        label.text = "Последнее"
        label.textColor = MainTabBarController().selectedItemColor
//        label.contentMode = .scaleAspectFill
        label.textAlignment = .center
        return label
    }()
    


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black
        contentView.layer.borderWidth = 1
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}



private extension HomeNavigationTableViewCell {
    func setupViews(){
       contentView.addSubview(navigationView)
        
    }
    func setupConstraints(){
        navigationView.snp.makeConstraints { make in
            make.top.equalToSuperview().multipliedBy(0.1)
            make.bottom.equalToSuperview().multipliedBy(0.8)
            make.leading.trailing.equalToSuperview()
            
//            make.edges.equalToSuperview()
            
       }
    }
}
