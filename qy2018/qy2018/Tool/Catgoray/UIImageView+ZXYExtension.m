//
//  UIImageView+ZXYExtension.m
//  UIImage和UIImageView分类
//
//  Created by zxy on 2018/1/4.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "UIImageView+ZXYExtension.h"
#import "UIImageView+WebCache.h"
#import "UIImage+ZXYExtension.h"
@implementation UIImageView (ZXYExtension)
-(void)setCircleProfileImageFromUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage{
    UIImage *placeholdImg=[placeholderImage circleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholdImg completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if(image==nil)return ;
        self.image=[image circleImage];
    }];
}
-(void)setNormalProfileImageFromUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if(image==nil)return ;
        self.image=image;
    }];
}
@end
