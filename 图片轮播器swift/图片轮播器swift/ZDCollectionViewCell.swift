//
//  ZDCollectionViewCell.swift
//  图片轮播器－swift
//
//  Created by zz on 16/3/2.
//  Copyright © 2016年 zz. All rights reserved.
//

import UIKit

class ZDCollectionViewCell: UICollectionViewCell {

    var url: NSURL?{
        didSet{
        
        imageView.image = UIImage(data: NSData(contentsOfURL: url!)!)
        }
    }
    
    override init(frame: CGRect) {
    
        super.init(frame: frame)
        
        setupUI()
        
    }

    private var imageView: UIImageView = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//MARK: - 界面设置
extension ZDCollectionViewCell{

    private func setupUI(){
    
        backgroundColor = UIColor.whiteColor()
        contentView.addSubview(imageView)
        imageView.frame = self.bounds
    }
}
