//
//  DZFBBHouseInfoHeader.m
//  HouseInfo
//
//  Created by 陈东芝 on 17/4/1.
//  Copyright © 2017年 陈东芝. All rights reserved.
//

#import "DZFBBHouseInfoHeader.h"

@implementation DZFBBHouseInfoHeader

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData {
    _moveShowBottomHeight = 50.0;
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
        CGPoint offset = [change[@"new"] CGPointValue];
        ////将偏移量转换相对header的高度
        CGFloat offsetY = startContentInsetTop+offset.y;
        if (offsetY <= (CGRectGetHeight(self.bounds)-_moveShowBottomHeight)) {
            CGRect frame = self.frame;
            frame.origin.y = -offsetY;
            self.frame = frame;
        }else {
            if (CGRectGetMinY(self.frame) != -(CGRectGetHeight(self.bounds)-_moveShowBottomHeight)) {
                CGRect frame = self.frame;
                frame.origin.y = -(CGRectGetHeight(self.bounds)-_moveShowBottomHeight);
                self.frame = frame;
            }
        }
    }
}

#pragma mark - setter
- (void)setSV_Content:(UIScrollView *)SV_Content {
    if (_SV_Content) {
        [_SV_Content removeObserver:self forKeyPath:@"contentOffset"];
    }
    _SV_Content = SV_Content;
     [_SV_Content addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    startContentInsetTop = _SV_Content.contentInset.top;
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect canTouchPath = CGRectMake(0, CGRectGetHeight(self.bounds)-_moveShowBottomHeight, CGRectGetWidth(self.bounds),_moveShowBottomHeight);
    return CGRectContainsPoint(canTouchPath, point);
}


@end
