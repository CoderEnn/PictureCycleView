//
//  ZDCollectionView.m
//  图片轮播器－oc
//
//  Created by zz on 16/2/27.
//  Copyright © 2016年 zz. All rights reserved.
//

#import "ZDCollectionView.h"
#import "ZDFlowLayout.h"
#import "ZDCollectionViewCell.h"

@interface ZDCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) NSArray <NSURL *> *urls;
@property (copy, nonatomic) void (^didSelectedCallBack)(NSInteger);
@end
@implementation ZDCollectionView
static NSString *ID = @"cell";
- (instancetype)initWithURLs:(NSArray <NSURL *> *)urls didSelected:(void (^)(NSInteger index))didSelected{

    self = [super initWithFrame:CGRectZero collectionViewLayout:[[ZDFlowLayout alloc]init]];

    self.dataSource = self;
    self.delegate = self;
    [self registerClass:[ZDCollectionViewCell class] forCellWithReuseIdentifier:ID];
    
//    self.showsHorizontalScrollIndicator = NO;
//    self.pagingEnabled = YES;
//    self.bounces = NO;
    
    self.urls = urls;
    
    dispatch_async(dispatch_get_main_queue(), ^{
    
        //这段代码要放在主队列中，待主线程任务执行完，就会执行这段代码
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.urls.count inSection:0];
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft  animated:NO];


    });

    return self;

}
//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//
//    return MAXFLOAT;
//}
#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.urls.count * (self.urls.count == 1? 1 : 20);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ZDCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.url = self.urls[indexPath.item % self.urls.count];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}
#pragma mark - UICollectionViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger offset = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    // 判断是否是最后一页
    if (offset == [self numberOfItemsInSection:0] - 1 || offset == 0) {
        offset = self.urls.count - (offset == 0 ? 0 : 1);
        
        scrollView.contentOffset = CGPointMake(offset * scrollView.bounds.size.width, 0);
    }
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didSelectedCallBack != nil) {
        self.didSelectedCallBack(indexPath.item % self.urls.count);
    }
}
@end
