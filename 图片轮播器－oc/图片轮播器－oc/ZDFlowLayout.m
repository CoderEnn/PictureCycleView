//
//  ZDFlowLayout.m
//  图片轮播器－oc
//
//  Created by zz on 16/2/27.
//  Copyright © 2016年 zz. All rights reserved.
//

#import "ZDFlowLayout.h"

@implementation ZDFlowLayout
-(void)prepareLayout{

    [super prepareLayout];
    
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    
}
@end
