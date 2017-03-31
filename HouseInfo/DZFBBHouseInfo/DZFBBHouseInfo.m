//
//  DZFBBHouseInfo.m
//  HouseInfo
//
//  Created by 陈东芝 on 17/4/1.
//  Copyright © 2017年 陈东芝. All rights reserved.
//

#import "DZFBBHouseInfo.h"

@interface DZFBBHouseInfo () {
    DZFBBHouseInfoHeader *houseInfoHeader;
}
@property (nonatomic, retain) UIScrollView *SV_Content;
@property (nonatomic, retain) UIScrollView *SV1;

@end

@implementation DZFBBHouseInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
   
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.view addSubview:self.SV_Content];
    
    _SV1 = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _SV1.backgroundColor = [UIColor whiteColor];
    _SV1.contentInset = UIEdgeInsetsMake(250, 0, 0, 0);
    _SV1.contentSize = CGSizeMake(0, 800);
    [self.SV_Content addSubview:_SV1];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 414, 800)];
    view.backgroundColor = [UIColor redColor];
    [_SV1 addSubview:view];
    
    houseInfoHeader = [[DZFBBHouseInfoHeader alloc] initWithFrame:CGRectMake(0, 0, 414, 250)];
    houseInfoHeader.backgroundColor = [UIColor whiteColor];
    houseInfoHeader.moveShowBottomHeight = 60.0;
    houseInfoHeader.SV_Content = _SV1;
    [self.view addSubview:houseInfoHeader];
}
- (UIScrollView *)SV_Content {
    if (_SV_Content == nil) {
        _SV_Content = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _SV_Content.backgroundColor = [UIColor blueColor];
        _SV_Content.pagingEnabled = YES;
        _SV_Content.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*3, 0);
    }
    return _SV_Content;
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
