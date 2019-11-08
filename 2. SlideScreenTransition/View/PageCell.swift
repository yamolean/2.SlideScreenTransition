//
//  CollectionViewCell.swift
//  2. SlideScreenTransition
//
//  Created by 矢守叡 on 2019/11/03.
//  Copyright © 2019 yamolean. All rights reserved.
//

import UIKit

final class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            
            guard let unwrappedPage = page else {return}
            screenImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headertext, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            descriptionTextview.attributedText = attributedText
            descriptionTextview.textAlignment = .center
        }
    }
    
    let screenImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Image1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextview: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join us today in out fun and games!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Dont wait any longer! We hope to see you in out stores soon", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)

        setupLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupLayout() {
        
        let topimageContainerView = UIView()
        addSubview(topimageContainerView)
        topimageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topimageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topimageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topimageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topimageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topimageContainerView.addSubview(screenImageView)
        
        screenImageView.centerXAnchor.constraint(equalTo: topimageContainerView.centerXAnchor).isActive = true
        screenImageView.centerYAnchor.constraint(equalTo: topimageContainerView.centerYAnchor).isActive = true
        screenImageView.heightAnchor.constraint(equalTo: topimageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(descriptionTextview)
        
        descriptionTextview.topAnchor.constraint(equalTo: topimageContainerView.bottomAnchor).isActive = true
        descriptionTextview.leftAnchor.constraint(equalTo: leftAnchor,constant: 24).isActive = true
        descriptionTextview.rightAnchor.constraint(equalTo: rightAnchor,constant: -24).isActive = true
        descriptionTextview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
}
