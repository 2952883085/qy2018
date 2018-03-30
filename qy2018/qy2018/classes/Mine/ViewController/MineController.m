//
//  MineController.m
//  qy2018
//
//  Created by zxy on 2018/3/27.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "MineController.h"

@interface MineController ()

@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}
#pragma mark -设置导航栏
-(void)setupNavigationBar{
    self.navigationItem.title = @"个人中心";
    UIButton *rightItem = [UIButton cz_textButton:nil fontSize:0 normalColor:nil ImageName:@"QYNavSettingWhite"];
    [rightItem setImage:[UIImage imageNamed:@"QYNavSettingGreen"] forState:UIControlStateHighlighted];
    rightItem.frame = CGRectMake(10, 0, 30, 30);
    [rightItem addTarget:self action:@selector(setBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [view addSubview:rightItem];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
}

-(void)setBtnClick:(UIButton *)sender{
    NSLog(@"设置按钮被点击了");
}


@end
