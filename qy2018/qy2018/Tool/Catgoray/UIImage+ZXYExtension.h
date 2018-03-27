//
//  UIImage+ZXYExtension.h
//  UIImage和UIImageView分类
//
//  Created by zxy on 2018/1/4.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZXYExtension)
//将会获取到的图片装成圆形
-(instancetype)circleImage;
//图片不做圆角处理正常显示
-(instancetype)normalImage;
//传入本地图片名称，将图片转成圆形
+(instancetype)circleImage:(NSString *)imageName;
//传入本地图片名称，不做圆角处理
+(instancetype)normalImage:(NSString *)imageName;
@end
