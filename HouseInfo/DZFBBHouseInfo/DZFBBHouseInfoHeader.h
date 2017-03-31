//
//  DZFBBHouseInfoHeader.h
//  HouseInfo
//
//  Created by 陈东芝 on 17/4/1.
//  Copyright © 2017年 陈东芝. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZFBBHouseInfoHeader : UIView {
    CGFloat startContentInsetTop;
}

@property (nonatomic, assign) CGFloat moveShowBottomHeight;
@property (nonatomic, retain) UIScrollView *SV_Content;

@end
