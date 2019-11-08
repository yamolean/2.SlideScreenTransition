//
//  SwipeController.swift
//  2. SlideScreenTransition
//
//  Created by 矢守叡 on 2019/11/03.
//  Copyright © 2019 yamolean. All rights reserved.
//

import UIKit

final class SwipeController: UICollectionViewController,
UICollectionViewDelegateFlowLayout {
    
    
    
    let pages = [
        
        Page(imageName: "Image1", headertext: "南無無辺行菩薩南無上行菩薩",bodyText: "雨ニモマケズ風ニモマケズ雪ニモ夏ノ暑サニモマケヌ丈夫ナカラダヲモチ慾ハナク決シテ瞋ラズイツモシヅカニワラッテヰル一日ニ玄米四合ト味噌ト少シノ野菜ヲタベ"),
        Page(imageName: "Image2", headertext: "南無多宝如来南無妙法蓮華経",bodyText: "アラユルコトヲジブンヲカンジョウニ入レズニヨクミキキシワカリソシテワスレズ野原ノ松ノ林ノ小サナ萓ブキノ小屋ニヰテ東ニ病気ノコドモアレバ行ッテ看病シテヤリ西ニツカレタ母アレバ行ッテソノ稲ノ朿ヲ"),
        Page(imageName: "Image3", headertext: "サウイフモノニ／ワタシハナリタイ",bodyText: "南ニ死ニサウナ人アレバ行ッテコハガラナクテモイヽトイヒ北ニケンクヮヤソショウガアレバツマラナイカラヤメロトイヒヒドリノトキハナミダヲナガシサムサノナツハオロオロアルキミンナニデクノボートヨバレホメラレモセズクニモサレズサウイフモノニワタシハナリタイ")
        
        //追加したら勝手に色々増える
    ]
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrev(){
        
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.koiPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext(){
        
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .koiPink
        pc.pageIndicatorTintColor = .usuiPink
        return pc
    }()
    
    fileprivate func setupBottomControls() {
        
        let bottomControlsStackView = UIStackView(arrangedSubviews:
            [
                previousButton,
                pageControl,
                nextButton
            ])
        
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
        
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
