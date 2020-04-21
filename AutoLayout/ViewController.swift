//
//  ViewController.swift
//  AutoLayout
//
//  Created by Mobolaji Moronfolu on 3/22/20.
//  Copyright © 2020 Mobolaji Moronfolu. All rights reserved.
//

import UIKit

extension UIColor{
    static var mainPink =  UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
}

class ViewController: UIViewController {
    let worldImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "World")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: " Let's go around the world", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    fileprivate func setupBottomLayout(){
        let cyanView = UIView()
        cyanView.backgroundColor = .cyan
        
        if pageController.currentPage == 4 {
            NextButton.setTitleColor(.gray, for: .normal);
            NextButton.isEnabled = false
        }
        else{
            NextButton.setTitleColor(.mainPink, for: .normal)
        }
        
        if pageController.currentPage == 0{
            previousButton.setTitleColor(.gray, for: .normal);
            previousButton.isEnabled = false
        }
        else{
            previousButton.setTitleColor(.mainPink, for: .normal)
        }
        
        let bottomControlStackView = UIStackView(arrangedSubviews: [previousButton,pageController,NextButton])
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
        view.addSubview(bottomControlStackView)
        
        NSLayoutConstraint.activate(
            [bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
             bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             bottomControlStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -50)
            ]
        )
    }

    private let previousButton: UIButton = {
        let button  = UIButton(type: .system)
        button.setTitle("Previous", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.darkGray, for: .normal)
        return button
    }()
    
    private let NextButton: UIButton = {
        let button  = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let pageController: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = .red
        return pc
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(descriptionView)
        setupBottomLayout()
        setupLayout()
        // Do any additional setup after loading the view.
    }
    
    private func setupLayout(){
        
        let topImageViewController = UIView()
        topImageViewController.backgroundColor = .green
        view.addSubview(topImageViewController)
        topImageViewController.translatesAutoresizingMaskIntoConstraints = false
        topImageViewController.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        topImageViewController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor) .isActive = true
        topImageViewController.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor) .isActive = true
        topImageViewController.trailingAnchor.constraint(equalTo: view.trailingAnchor) .isActive = true
        
        topImageViewController.addSubview(worldImageView)
        worldImageView.centerXAnchor.constraint(equalTo: topImageViewController.centerXAnchor).isActive = true
        worldImageView.centerYAnchor.constraint(equalTo: topImageViewController.centerYAnchor).isActive = true
        worldImageView.heightAnchor.constraint(equalTo: topImageViewController.heightAnchor, multiplier: 0.5).isActive =  true
        worldImageView.widthAnchor.constraint(equalTo: topImageViewController.widthAnchor, multiplier: 0.5).isActive =  true
        
        descriptionView.topAnchor.constraint(equalTo: topImageViewController.bottomAnchor, constant: 1).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        descriptionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        descriptionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }

}

