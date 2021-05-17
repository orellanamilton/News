//
//  UIImageViewExtension.swift
//  NewsAPP
//
//  Created by Milton Orellana on 16/05/2021.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(imageURL: String) {
        self.kf.setImage(with: URL(string: imageURL))
    }
}
