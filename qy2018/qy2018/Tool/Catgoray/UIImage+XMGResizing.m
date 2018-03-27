//
//  UIImage+XMGResizing.m
//  MyXmpp
//
//  Created by fgnc on 2016/11/2.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "UIImage+XMGResizing.h"

@implementation UIImage (XMGResizing)
+ (UIImage *)resizingImageWithName:(NSString *)name
{
    UIImage *normalImg = [UIImage imageNamed:name];
    
    CGFloat w = normalImg.size.width * 0.5f;
    CGFloat h = normalImg.size.height * 0.5f;
    //设置图片拉伸端盖的值
    UIEdgeInsets edgeInsets=UIEdgeInsetsMake(h, w, h, w);
    //设置图片拉伸模式
    UIImageResizingMode mode=UIImageResizingModeStretch;
    //拉伸图片
    UIImage *newImage=[normalImg resizableImageWithCapInsets:edgeInsets resizingMode:mode];
    
    return newImage;
}
@end
