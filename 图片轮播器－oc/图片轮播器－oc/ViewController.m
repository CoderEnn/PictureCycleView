//
//  ViewController.m
//  图片轮播器－oc
//
//  Created by zz on 16/2/27.
//  Copyright © 2016年 zz. All rights reserved.
//

#import "ViewController.h"
#import "ZDCollectionView.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray *urls;

@end

@implementation ViewController

-(NSArray *)urls{

    if (_urls == nil) {
        
        NSMutableArray *temp = [NSMutableArray array];
        for (int i = 0; i< 3; i++) {
            
            NSString *path = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%02d",i+1] ofType:@"jpg"];
            NSURL *url = [NSURL fileURLWithPath:path];
            [temp addObject:url];
        }
        _urls = temp.copy;
    }
    return _urls;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    ZDCollectionView *pictureCollectionView = [[ZDCollectionView alloc]initWithURLs:self.urls didSelected:nil];
    
    pictureCollectionView.frame = CGRectMake(20, 20, self.view.bounds.size.width - 40, 200);
    
    [self.view addSubview:pictureCollectionView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
