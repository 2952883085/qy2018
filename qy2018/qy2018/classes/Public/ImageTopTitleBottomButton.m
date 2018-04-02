//
//  ImageTopTitleBottomButton.m
//  qy2018
//
//  Created by zxy on 2018/4/2.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "ImageTopTitleBottomButton.h"

@implementation ImageTopTitleBottomButton

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.xmg_y = 25;
    self.imageView.xmg_centerX = self.xmg_width*0.5;
    self.titleLabel.xmg_y = self.imageView.xmg_bottom;
    self.titleLabel.xmg_height = self.xmg_height - self.imageView.xmg_height - self.imageView.xmg_y;
    self.titleLabel.xmg_width = self.xmg_width;
    self.titleLabel.xmg_x = 0;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
