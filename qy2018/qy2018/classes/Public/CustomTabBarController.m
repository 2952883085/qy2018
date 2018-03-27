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

}

@end
