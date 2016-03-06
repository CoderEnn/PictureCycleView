//
//  ZDCollectionView.h
//  图片轮播器－oc
//
//  Created by zz on 16/2/27.
//  Copyright © 2016年 zz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDCollectionView : UICollectionView

- (instancetype)initWithURLs:(NSArray <NSURL *> *)urls didSelected:(void (^)(NSInteger index))didSelected;

@end
