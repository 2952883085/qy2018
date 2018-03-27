//
//  UIImage+ZXYExtension.m
//  UIImage和UIImageView分类
//
//  Created by zxy on 2018/1/4.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "UIImage+ZXYExtension.h"
@implementation UIImage (ZXYExtension)
-(instancetype)circleImage{
    //开启图形上下文
    /*第二参数：opaque不透明度 NO(透明) YES(不透明，图片显示性能高，
     此参数为YES，如果倒圆角，四周会有黑边,需要设置填充颜色，可以加个UIColor参数，跟随父视图颜色)
      */
    //第三个参数:scale 图片显示像素，0根据设备自动选择
    UIGraphicsBeginImageContextWithOptions(self.size,YES,0);
    //获取当前上下文
    CGContextRef ref=UIGraphicsGetCurrentContext();
    
    //添加一个圆
    CGRect rect=CGRectMake(0, 0, self.size.width, self.size.height);
    
    //设置填充颜色
    [[UIColor whiteColor]setFill];
     CGContextFillRect(ref, rect);
    
    //设置圆形区域，此后绘图在圆形区域里绘制，所以设置填充需在这之前
    CGContextAddEllipseInRect(ref, rect);
    //裁切
    CGContextClip(ref);
    
    //开始绘制
    [self drawInRect:rect];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    
    //结束上下文
    UIGraphicsEndImageContext();
    return image;
}

-(instancetype)normalImage{
    UIGraphicsBeginImageContextWithOptions(self.size, YES, 0);
    
    CGRect rect=CGRectMake(0, 0, self.size.width, self.size.height);
    [self drawInRect:rect];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


+(instancetype)circleImage:(NSString *)imageName{
    return [[self imageNamed:imageName] circleImage];
}

+(instancetype)normalImage:(NSString *)imageName{
    return [[self imageNamed:imageName] normalImage];
}
@end
