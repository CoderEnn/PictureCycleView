//
//  ZDFlowLayout.swift
//  图片轮播器－swift
//
//  Created by zz on 16/3/1.
//  Copyright © 2016年 zz. All rights reserved.
//

import UIKit

class ZDFlowLayout: UICollectionViewFlowLayout {

    override func prepareLayout() {
        super.prepareLayout()
        
        itemSize = (collectionView?.bounds.size)!
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.scrollDirection = .Horizontal
        self.collectionView?.bounces = false
        self.collectionView?.pagingEnabled = true
    }
}
