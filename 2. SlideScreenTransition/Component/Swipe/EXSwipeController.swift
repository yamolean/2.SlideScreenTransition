//
//  EXSwipeController.swift
//  2. SlideScreenTransition
//
//  Created by 矢守叡 on 2019/11/03.
//  Copyright © 2019 yamolean. All rights reserved.
//

import UIKit

extension SwipeController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: {(_) in
            
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }){(_) in
            
        }
    }
}
