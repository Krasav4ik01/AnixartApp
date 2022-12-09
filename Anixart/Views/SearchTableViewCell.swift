//
//  SearchTableViewCell.swift
//  Anixart
//
//  Created by Rustem on 11.11.2022.
//

import UIKit
import SnapKit
class SearchTableViewCell: UICollectionViewCell {

    lazy private var topImages: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "\(GenerateAnimeData().getAnimeImagesForComments().randomElement() ?? "chainsawman")" )
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.backgroundColor = .clear
//        contentView.layer.borderWidth = 2
        
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}

private extension SearchTableViewCell{
    func setupViews(){
        contentView.addSubview(topImages)
    }
    func setupConstraints(){
        topImages.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
