//
//  QuickFocusCell.swift
//  HeadSpaceFocus
//
//  Created by 윤태웅 on 10/14/23.
//

import UIKit

class QuickFocusCell: UICollectionViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(_ quickFocus: QuickFocus) {
        imageView.image = UIImage(named: quickFocus.imageName)
        titleLabel.text = quickFocus.title
        descriptionLabel.text = quickFocus.description
    }
    
}
