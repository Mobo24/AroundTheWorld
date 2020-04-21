//
//  swipeControlCollectionViewController.swift
//  AutoLayout
//
//  Created by Mobolaji Moronfolu on 4/7/20.
//  Copyright © 2020 Mobolaji Moronfolu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
let pages = [continent(imageName: "World", Title: "World", Content: "Let's go around the world"),
continent(imageName: "Africa", Title: "Africa", Content: "Africa is the world's second-largest and second-most populous continent, after Asia. At about 30.3 million km2 (11.7 million square miles) including adjacent islands, it covers 6% of Earth's total surface area and 20% of its land area. With 1.3 billion peopleas of 2018, it accounts for about 16% of the world's human population. "),
continent(imageName: "Antartica", Title: "Antartica", Content: "Antarctica (/ænˈtɑːrtɪkə/ or /æntˈɑːrktɪkə/ is Earth's southernmost continent. It contains the geographic South Pole and is situated in the Antarctic region of the Southern Hemisphere, almost entirely south of the Antarctic Circle, and is surrounded by the Southern Ocean. At 14,200,000 square kilometres (5,500,000 square miles), it is the fifth-largest continent and nearly twice the size of Australia. At 0.00008 people per square kilometre, it is by far the least densely populated continent. About 98% of Antarctica is covered by ice that averages 1.9 km (1.2 mi; 6,200 ft) in thickness,[5] which extends to all but the northernmost reaches of the Antarctic Peninsula."),
continent(imageName: "Asia", Title: "Asia" , Content: "Asia (/ˈeɪʒə, ˈeɪʃə/ (About this soundlisten)) is Earth's largest and most populous continent, located primarily in the Eastern and Northern Hemispheres. It shares the continental landmass of Eurasia with the continent of Europe and the continental landmass of Afro-Eurasia with both Europe and Africa. Asia covers an area of 44,579,000 square kilometres (17,212,000 sq mi), about 30% of Earth's total land area and 8.7% of the Earth's total surface area. The continent, which has long been home to the majority of the human population, was the site of many of the first civilizations. Asia is notable for not only its overall large size and population, but also dense and large settlements, as well as vast barely populated regions. Its 4.5 billion people (as of June 2019) constitute roughly 60% of the world's population"),
continent(imageName: "Australia", Title: "Australia", Content: "Australia, officially the Commonwealth of Australia, is a sovereign country comprising the mainland of the Australian continent, the island of Tasmania, and numerous smaller islands. It is the largest country in Oceania and the world's sixth-largest country by total area. The population of 26 million[6] is highly urbanised and heavily concentrated on the eastern seaboard.[13] Australia's capital is Canberra, and its largest city is Sydney. The country's other major metropolitan areas are Melbourne, Brisbane, Perth, and Adelaide."),
continent(imageName: "Europe", Title: "Europe", Content: "Europe is a continent located entirely in the Northern Hemisphere and mostly in the Eastern Hemisphere. It comprises the westernmost part of Eurasia and is bordered by the Arctic Ocean to the north, the Atlantic Ocean to the west, the Mediterranean Sea to the south, and Asia to the east. Europe is commonly considered to be separated from Asia by the watershed divides of the Ural and Caucasus Mountains, the Ural River, the Caspian and Black Seas and the waterways of the Turkish Straits. However, Europe is generally accorded the status of a full continent because of its great physical size and the weight of history and tradition."),
continent(imageName: "North America", Title:  "North America", Content: "North America is a continent entirely within the Northern Hemisphere and almost all within the Western Hemisphere. In can also be described as a northern subcontinent of the Americas, or America, in models that use fewer than seven continents. It is bordered to the north by the Arctic Ocean, to the east by the Atlantic Ocean, to the west and south by the Pacific Ocean, and to the southeast by South America and the Caribbean Sea."),
continent(imageName: "South America", Title: "South America", Content:  "South America is a continent in the Western Hemisphere, mostly in the Southern Hemisphere, with a relatively small portion in the Northern Hemisphere. It may also be considered a subcontinent of the Americas, which is how it is viewed in most of Europe and the Spanish and Portuguese-speaking regions of the Americas. The reference to South America instead of other regions (like Latin America or the Southern Cone) has increased in the last decades due to changing geopolitical dynamics (in particular, the rise of Brazil)")]

class swipeControl: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private func setupBottomLayout(){
        let cyanView = UIView()
        cyanView.backgroundColor = .cyan
        
        
        
        let bottomControlStackView = UIStackView(arrangedSubviews: [previousButton,pageController,NextButton])
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
        view.addSubview(bottomControlStackView)
        
        NSLayoutConstraint.activate(
            [bottomControlStackView.bottomAnchor.constraint(equalTo:    view.safeAreaLayoutGuide.bottomAnchor),
             bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             bottomControlStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -50)
            ]
        )
    }

    let previousButton: UIButton = {
        let button  = UIButton(type: .system)
        button.setTitle("Previous", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handleprevious), for: .touchUpInside)
        return button
    }()
    
    let NextButton: UIButton = {
        let button  = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handlenext), for: .touchUpInside)
        return button
    }()
    
     let pageController: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = .red
        return pc
    }()
    
    @objc private func handlenext(){
        let nextPage =  min(pageController.currentPage + 1, pages.count - 1 )
        let indexPath = IndexPath(item: nextPage, section: 0)
        pageController.currentPage = nextPage
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        if pageController.currentPage == pages.count - 1{
            NextButton.setTitleColor(.gray, for: .normal)
            NextButton.isEnabled = false
        }
        else{
            previousButton.setTitleColor(.mainPink, for: .normal);
            previousButton.isEnabled = true
            NextButton.setTitleColor(.mainPink, for: .normal)
            NextButton.isEnabled = true
        }
       
    }

    @objc private func handleprevious(){
        let nextPage =  max(pageController.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextPage, section: 0)
        pageController.currentPage = nextPage
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        if pageController.currentPage == 0{
            previousButton.setTitleColor(.gray, for: .normal)
            previousButton.isEnabled = false
        }
    
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            setupBottomLayout()
            
            collectionView?.backgroundColor = .white
            collectionView?.register(ContinentCell.self, forCellWithReuseIdentifier: "cellId")
            collectionView?.dataSource = self
            collectionView?.delegate = self
            collectionView?.isPagingEnabled = true
            
        }
        
       
}

