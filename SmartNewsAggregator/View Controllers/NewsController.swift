//
//  NewsController.swift
//  SmartNewsAggregator
//
//  Created by Vittorio on 24/03/2020.
//  Copyright © 2020 Vittorio. All rights reserved.
//

import UIKit
import SwiftyJSON
import QuartzCore
import LBTAComponents

class NewsCell: DatasourceCell {
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupNewsCellView()
        
    }
    
    let titleNews: UILabel = {
        let titleLablel = UILabel()
        titleLablel.text = "This is the Title of the news"
        titleLablel.textAlignment = .center
        titleLablel.font = UIFont.boldSystemFont(ofSize: 16)
        //titleLablel.textColor = .black
        titleLablel.translatesAutoresizingMaskIntoConstraints = false
        return titleLablel
    }()
    
    let newsLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sampleImage")
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let descriptionText: UITextView = {
        let textView = UITextView()
        textView.text = " This is a preview of an article, it will be shown a bit better in the future when there will be an article"
        textView.backgroundColor = .gray
        textView.font = UIFont.systemFont(ofSize: 12)
        return textView
    }()
    
    let readMoreButton : UIButton = {
        let readButton = UIButton ()
        readButton.setImage(UIImage(named: "right-arrow"), for: .normal)
        return readButton
    }()
    
    func setupNewsCellView() {
        backgroundColor = .gray
        addSubview(titleNews)
        addSubview(newsLogo)
        addSubview(descriptionText)
        addSubview(readMoreButton)
        
        newsLogo.anchor(self.safeAreaLayoutGuide.topAnchor, left: self.safeAreaLayoutGuide.leftAnchor, bottom:nil, right: readMoreButton.leftAnchor, topConstant: 12, leftConstant: 10, bottomConstant:0 , rightConstant: 20, widthConstant: 150, heightConstant: 150)
        
        titleNews.anchor(newsLogo.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor,
                         topConstant: 10, leftConstant: 12, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 30)
        
        descriptionText.anchor(titleNews.bottomAnchor, left: newsLogo.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 5, leftConstant: 5, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        readMoreButton.anchor(topAnchor, left:nil, bottom:nil, right: self.rightAnchor, topConstant: 75, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 20, heightConstant:34)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class NewsController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    override func viewDidLoad() {
        super .viewDidLoad()
        collectionView?.backgroundColor = .black
        navigationItem.title = "News"
        collectionView?.register(NewsCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for : indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
}


