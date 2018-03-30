//
//  NavigationBaseController.m
//  qy2018
//
//  Created by zxy on 2018/3/30.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "NavigationBaseController.h"

@interface NavigationBaseController ()

@end

@implementation NavigationBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor cz_colorWithHex:0x4FA26F]];
}


@end
