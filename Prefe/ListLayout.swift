//
//  ListLayout.swift
//  Prefe
//
//  Created by Edward Joon-Hyuk Chang on 06/11/2016.
//  Copyright © 2016 Prefe. All rights reserved.
//

import UIKit

class ListLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    func setupLayout() {
        minimumLineSpacing = 0
        sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
}
