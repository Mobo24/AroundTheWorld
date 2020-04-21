//
//  swipingcontroller+Uicollectionview.swift
//  AutoLayout
//
//  Created by Mobolaji Moronfolu on 4/19/20.
//  Copyright © 2020 Mobolaji Moronfolu. All rights reserved.
//

import UIKit

extension swipeControl{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
               return 0
           }
       
           override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
               return pages.count
           }
           
           override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ContinentCell
               let page = pages[indexPath.item]
               cell.page = page
               if pageController.currentPage == 0{
                   previousButton.setTitleColor(.gray, for: .normal);
                   previousButton.isEnabled = false

               }
               else if pageController.currentPage == pages.count - 1{
                   NextButton.setTitleColor(.gray, for: .normal)
                   NextButton.isEnabled = false
               }
               else{
                   previousButton.setTitleColor(.mainPink, for: .normal);
                   previousButton.isEnabled = true
                   NextButton.setTitleColor(.mainPink, for: .normal)
                   NextButton.isEnabled = true
               }
               return cell
           }
           
       override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
           let x = targetContentOffset.pointee.x
           pageController.currentPage = Int(x/view.frame.width)
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: view.frame.width, height: view.frame.height)
       }

}
