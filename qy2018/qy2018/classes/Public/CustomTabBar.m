//
//  CustomTabBar.m
//  qy2018
//
//  Created by zxy on 2018/3/27.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "CustomTabBar.h"

@implementation CustomTabBar

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat w = screenWidth/5;
    for (UIView *subView in self.subviews) {
        if(subView.class != NSClassFromString(@"UITabBarButton"))continue;
        subView.frame = CGRectMake(subView.xmg_x, subView.xmg_y, w,subView.xmg_height);
    }
}

@end
