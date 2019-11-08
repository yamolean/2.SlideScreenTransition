//
//  ViewController.swift
//  2. SlideScreenTransition
//
//  Created by 矢守叡 on 2019/11/02.
//  Copyright © 2019 yamolean. All rights reserved.
//

//import UIKit
//
//final class ViewController: UIViewController {
//    
//    let screenImageView1: UIImageView = {
//        let imageView = UIImageView(image: #imageLiteral(resourceName: "Image1"))
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//    
//    let descriptionTextview: UITextView = {
//        let textView = UITextView()
//        
//        let attributedText = NSMutableAttributedString(string: "Join us today in out fun and games!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
//        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Dont wait any longer! We hope to see you in out stores soon", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor: UIColor.gray]))
//        textView.attributedText = attributedText
//        
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        textView.textAlignment = .center
//        textView.isEditable = false
//        textView.isScrollEnabled = false
//        return textView
//    }()
//    
//    let previousButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("PREV", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//        button.setTitleColor(.gray, for: .normal)
//        return button
//    }()
//    
//    let nextButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("NEXT", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//        button.setTitleColor(.koiPink, for: .normal)
//        return button
//    }()
//    
//    let pageControl: UIPageControl = {
//        let pc = UIPageControl()
//        pc.currentPage = 0
//        pc.numberOfPages = 4
//        pc.currentPageIndicatorTintColor = .koiPink
//        pc.pageIndicatorTintColor = .usuiPink
//        return pc
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.addSubview(descriptionTextview)
//        
//        setupBottomControls()
//        
//        setupLayout()
//        
//    }
//    
//    fileprivate func setupBottomControls() {
//        
//        let bottomControlsStackView = UIStackView(arrangedSubviews:
//            [
//            previousButton,
//            pageControl,
//            nextButton
//            ])
//        
//        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
//        bottomControlsStackView.distribution = .fillEqually
//        view.addSubview(bottomControlsStackView)
//        
//        NSLayoutConstraint.activate([
//            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
//            ])
//        
//    }
//    
//    fileprivate func setupLayout() {
//        
//        let topimageContainerView = UIView()
//        view.addSubview(topimageContainerView)
//        topimageContainerView.translatesAutoresizingMaskIntoConstraints = false
//        topimageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        topimageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        topimageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        topimageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
//        
//        topimageContainerView.addSubview(screenImageView1)
//        
//        screenImageView1.centerXAnchor.constraint(equalTo: topimageContainerView.centerXAnchor).isActive = true
//        screenImageView1.centerYAnchor.constraint(equalTo: topimageContainerView.centerYAnchor).isActive = true
//        screenImageView1.heightAnchor.constraint(equalTo: topimageContainerView.heightAnchor, multiplier: 0.5).isActive = true
//        
//        descriptionTextview.topAnchor.constraint(equalTo: topimageContainerView.bottomAnchor).isActive = true
//        descriptionTextview.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 24).isActive = true
//        descriptionTextview.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -24).isActive = true
//        descriptionTextview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//        
//    }
//    
//}
//
