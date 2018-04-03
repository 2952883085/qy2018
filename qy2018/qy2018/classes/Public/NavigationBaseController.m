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
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor cz_colorWithHex:0x4FA26F]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"QYNavBackWhite.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftItemClick)];
    
}

#pragma mark -导航栏左按钮点击事件
-(void)leftItemClick{
    /*子类重写此方法，完成各自逻辑*/
    [self.navigationController popViewControllerAnimated:YES];
}

-(UITableView *)tabView{
    if(!_tabView){
        _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight - 64) style:UITableViewStylePlain];
        _tabView.dataSource = self;
        _tabView.delegate = self;
        [self.view addSubview:_tabView];
    }
    return _tabView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[UITableViewCell alloc]init];
}


@end
