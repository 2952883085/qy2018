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
