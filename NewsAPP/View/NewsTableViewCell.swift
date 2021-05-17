//
//  NewsTableViewCell.swift
//  NewsAPP
//
//  Created by Milton Orellana on 15/05/2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var webLabel: UILabel!
    @IBOutlet weak var newImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        newImage.layer.cornerRadius = 5
        newImage.clipsToBounds = true
        newImage.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    
    func configure(for news: Article) {

        descriptionLabel.text = news.title
        webLabel.text = news.source.name
        newImage.setImage(imageURL: news.urlToImage ?? "https://images.unsplash.com/photo-1583774139366-a903e7bc5236?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2811&q=80")
    }
    
}
