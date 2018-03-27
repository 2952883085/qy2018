//
//  UIImageView+ZXYExtension.h
//  UIImage和UIImageView分类
//
//  Created by zxy on 2018/1/4.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ZXYExtension)
//通过url设置圆形头像
-(void)setCircleProfileImageFromUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage;
//设置正常图片，也就是正方形的图片
-(void)setNormalProfileImageFromUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage;
@end
