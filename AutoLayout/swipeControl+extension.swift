//
//  swipeControl+extension.swift
//  AutoLayout
//
//  Created by Mobolaji Moronfolu on 4/18/20.
//  Copyright © 2020 Mobolaji Moronfolu. All rights reserved.
//

import UIKit

extension swipeControl{
 override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
        self.collectionViewLayout.invalidateLayout()
        if self.pageController.currentPage == 0 {
            self.collectionView?.contentOffset = .zero
        }
        else{
          let indexPath = IndexPath(item: self.pageController.currentPage, section: 0)
        self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
            
        }) { (_) in
           
            
        }
    }
        
}
