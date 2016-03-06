//
//  ZDCollectionViewCell.m
//  图片轮播器－oc
//
//  Created by zz on 16/2/27.
//  Copyright © 2016年 zz. All rights reserved.
//

#import "ZDCollectionViewCell.h"

@implementation ZDCollectionViewCell{

    UIImageView *_pictureView;
}
-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        _pictureView = [[UIImageView alloc]initWithFrame:self.bounds];//self.frame=(0,0,0,0)
        
        [self.contentView addSubview:_pictureView];
        
    }
    return self;
}
-(void)setUrl:(NSURL *)url{

    _url = url;
    NSData *data = [NSData dataWithContentsOfURL:url];
    _pictureView.image = [UIImage imageWithData:data];
    
}

@end
