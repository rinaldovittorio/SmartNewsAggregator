//
//  NewsTableViewCell.swift
//  SmartNewsAggregator
//
//  Created by Vittorio on 26/03/2020.
//  Copyright © 2020 Vittorio. All rights reserved.
//

import Foundation
import UIKit

class NewsTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(newsImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        newsImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        newsImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        newsImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        newsImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo:self.contentView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor).isActive = true
        
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

}
    
    let newsImageView : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    } ()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    } ()
    
}


