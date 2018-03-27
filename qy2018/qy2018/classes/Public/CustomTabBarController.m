//
//  CustomTabBarController.m
//  qy2018
//
//  Created by zxy on 2018/3/27.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "CustomTabBarController.h"
#import "RecommendController.h"
#import "DesinationController.h"
#import "TravelShopController.h"
#import "CommunityController.h"
#import "MineController.h"
#import "CustomTabBar.h"
@interface CustomTabBarController ()

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildCtl];
}

#pragma mark -添加子控制器
-(void)addChildCtl{
    RecommendController *ctl1=[[RecommendController alloc]init];
    [self childCtl:ctl1 normalImageName:@"TabBar_Recommend" selectedImageName:@"TabBar_Recommend_Highlight"];
    
    DesinationController *ctl2=[[DesinationController alloc]init];
    [self childCtl:ctl2 normalImageName:@"TabBar_Place" selectedImageName:@"TabBar_Place_Highlight"];
    
    TravelShopController *ctl3=[[TravelShopController alloc]init];
    [self childCtl:ctl3 normalImageName:@"TabBar_Shop" selectedImageName:@"TabBar_Shop_Highlight"];
    
    CommunityController *ctl4=[[CommunityController alloc]init];
    [self childCtl:ctl4 normalImageName:@"TabBar_Community" selectedImageName:@"TabBar_Community_Highlight"];
    
    MineController *ctl5=[[MineController alloc]init];
    [self childCtl:ctl5 normalImageName:@"TabBar_Mine" selectedImageName:@"TabBar_Mine_Highlight"];
    
    
}

-(void)childCtl:(UIViewController *)childCtl normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName{
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:childCtl];
    nav.navigationBarHidden=YES;
    if(normalImageName.length || selectedImageName.length){
        childCtl.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"" image:[[UIImage imageNamed:normalImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }
    [self addChildViewController:nav];
    
    [self setTabBar];

}

-(void)setTabBar{
    CustomTabBar *tb=[[CustomTabBar alloc]init];
    //系统tabBar为只读属性，要更改需用KVC方式
    [self setValue:tb forKey:@"tabBar"];
    CGSize size = CGSizeMake(tb.xmg_width/5, tb.xmg_height);
    tb.selectionIndicatorImage=[self drawTabBarItemBackgroundImageWithSize:size];
}

//绘制item背景图片
-(UIImage *)drawTabBarItemBackgroundImageWithSize:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(ctx, 239.0/255, 21.0/255, 75.0/255, 1);
    CGContextFillRect(ctx, CGRectMake(0,0, size.width, size.height));
    UIImage *img=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
