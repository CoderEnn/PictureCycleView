//
//  LoopView.swift
//  图片轮播器－swift
//
//  Created by zz on 16/2/28.
//  Copyright © 2016年 zz. All rights reserved.
//

import UIKit
let ID: String = "cell"
class LoopView: UICollectionView {
    
   
    
    convenience init(urls: [AnyObject]?) {
        
        self.init(frame: CGRectZero, collectionViewLayout: ZDFlowLayout())
        
        self.backgroundColor = UIColor.redColor()
        self.dataSource = self
        self.delegate = self
        self.urls = urls!
        self.registerClass(ZDCollectionViewCell.self, forCellWithReuseIdentifier: ID)
        
        dispatch_async(dispatch_get_main_queue()) {
            let indexPath: NSIndexPath = NSIndexPath(forItem: (urls?.count)!, inSection: 0)
            self.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Left, animated: false)
        }
        
    }
    //MARK: - 私有属性
     private var urls: [AnyObject] = [AnyObject]()
    var callBack: ((selected: Int)->())?

}
extension LoopView: UICollectionViewDataSource,UICollectionViewDelegate{

//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        return
//    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urls.count * ( urls.count == 1 ? urls.count : 20 )
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: ZDCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(ID, forIndexPath: indexPath) as! ZDCollectionViewCell
        cell.url = urls[indexPath.item % urls.count] as? NSURL
        return cell
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {

     
//        // 判断是否是最后一页
        let item: Int = collectionView(self, numberOfItemsInSection: 0)
        var off: Int = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
        if off == item - 1 || off == 0 {
            off = urls.count - (off == 0 ? 0 : 1)
            contentOffset = CGPoint(x: off * Int(scrollView.bounds.size.width), y: 0)
            
        }
        
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
         callBack?(selected: indexPath.item)
    }
}

