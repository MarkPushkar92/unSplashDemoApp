//
//  PhotoCell.swift
//  UnSpalshDemoApp
//
//  Created by Марк Пушкарь on 18.10.2021.
//

import Foundation
import UIKit
import SDWebImage

class PhotoCell: UICollectionViewCell {
    
    static let reuseId = "PhotoCell"
    
    private let photoimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var unsplashPhoto: UnsplashPhoto! {
        didSet {
            let photoUrl = unsplashPhoto.urls["regular"]
            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
            photoimageView.sd_setImage(with: url, completed: nil)
            
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoimageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpPhotoImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpPhotoImageView() {
        addSubview(photoimageView)
        let constraints = [
            photoimageView.topAnchor.constraint(equalTo: self.topAnchor),
            photoimageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            photoimageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            photoimageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
        
}
