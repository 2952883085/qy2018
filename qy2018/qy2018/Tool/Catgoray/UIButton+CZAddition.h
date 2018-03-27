//
//  UIButton+CZAddition.h
//
//  Created by 刘凡 on 16/5/17.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CZAddition)

/**
 创建文本按钮

 @param title            标题文字
 @param fontSize         字体大小
 @param normalColor      默认颜色
 @param selectedColor 高亮颜色

 @return UIButton
 */
+ (instancetype)cz_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor;


/**
 创建文本按钮-可以设置背景色

 @param title 标题
 @param fontSize 字体大小
 @param normalColor 文字正常颜色
 @param selectedColor 文字选中颜色
 @param bgColor 按钮背景颜色
 @return UIButton
 */
+ (instancetype)cz_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor backgroundColor:(UIColor *)bgColor;


/**
 创建文本按钮-通过url设置背景图片
 
 @param title               标题文字
 @param fontSize            字体大小
 @param normalColor         默认颜色
 @param backgroundImageUrl 背景图像url
 
 @return UIButton
 */
+ (instancetype)cz_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor backgroundImageUrl:(NSString *)backgroundImageUrl;



/**
 创建文本按钮-本地设置背景图片

 @param title               标题文字
 @param fontSize            字体大小
 @param normalColor         默认颜色
 @param selectedColor    高亮颜色
 @param backgroundImageName 背景图像名称

 @return UIButton
 */
+ (instancetype)cz_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor highlightedColor:(UIColor *)selectedColor backgroundImageName:(NSString *)backgroundImageName;

/**
 创建文本按钮
 
 @param title               标题文字
 @param fontSize            字体大小
 @param normalColor         默认颜色
 @param ImageName  本地图像名称
 
 @return UIButton
 */
+ (instancetype)cz_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor  ImageName:(NSString *)ImageName;

/**
 创建文本按钮
 
 @param title               标题文字
 @param fontSize            字体大小
 @param normalColor         默认颜色
 @param ImageUrl  网络图像url地址
 
 @return UIButton
 */
+ (instancetype)cz_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor  ImageUrl:(NSString *)ImageUrl;

/**
 创建图像按钮

 @param imageName           图像名称
 @param backgroundImageName 背景图像名称

 @return UIButton
 */
+ (instancetype)cz_imageButton:(NSString *)imageName backgroundImageName:(NSString *)backgroundImageName;

@end
