//
//  QuickFocusHeaderView.swift
//  HeadSpaceFocus
//
//  Created by 윤태웅 on 10/15/23.
//

import UIKit

class QuickFocusHeaderView: UICollectionReusableView {
        
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(_ title: String) {
        titleLabel.text = title
    }
}
