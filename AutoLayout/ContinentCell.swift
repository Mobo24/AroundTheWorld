//
//  ContinentCell.swift
//  AutoLayout
//
//  Created by Mobolaji Moronfolu on 4/8/20.
//  Copyright © 2020 Mobolaji Moronfolu. All rights reserved.
//

import UIKit

class ContinentCell: UICollectionViewCell{
    var page: continent? {
        didSet {
            guard let unwrappedPage = page else { return }
            worldImageView.image = UIImage(named: unwrappedPage.imageName)
            let attributedText1 = NSMutableAttributedString(string: page!.Title, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)])
             let attributedText2 = NSMutableAttributedString(string: page!.Content, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
            nameView.attributedText = attributedText1
            descriptionView.attributedText = attributedText2
            descriptionView.textAlignment = .center
            nameView.textAlignment = .center
           
        }
    }
    
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
    
    let nameView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: " Let's go around the world", attributes: [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 30)])
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
        
        
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        //backgroundColor = .purple
        setupLayout()
    }
    
    
    private func setupLayout(){
        
        let topImageViewController = UIView()
        //topImageViewController.backgroundColor = .green
        addSubview(topImageViewController)
        topImageViewController.translatesAutoresizingMaskIntoConstraints = false
        topImageViewController.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        topImageViewController.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor) .isActive = true
        topImageViewController.leadingAnchor.constraint(equalTo: leadingAnchor) .isActive = true
        topImageViewController.trailingAnchor.constraint(equalTo: trailingAnchor) .isActive = true
        
        topImageViewController.addSubview(worldImageView)
        worldImageView.centerXAnchor.constraint(equalTo: topImageViewController.centerXAnchor).isActive = true
        worldImageView.centerYAnchor.constraint(equalTo: topImageViewController.centerYAnchor, constant: -20).isActive = true
        worldImageView.heightAnchor.constraint(equalTo: topImageViewController.heightAnchor, multiplier: 0.5).isActive =  true
        worldImageView.widthAnchor.constraint(equalTo: topImageViewController.widthAnchor, multiplier: 0.5).isActive =  true
        addSubview(nameView)
        nameView.topAnchor.constraint(equalTo: topImageViewController.bottomAnchor, constant: -60).isActive = true
        nameView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        nameView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        nameView.bottomAnchor.constraint(equalTo: topImageViewController.bottomAnchor, constant: 40).isActive = true
        addSubview(descriptionView)
        descriptionView.topAnchor.constraint(equalTo: topImageViewController.bottomAnchor, constant: -20).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 35).isActive = true
        descriptionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -35).isActive = true
        descriptionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -60).isActive = true
    }
    required init?(coder aDecoder: NSCoder){
        fatalError("You don messed up")
        
    }
    
    
}
