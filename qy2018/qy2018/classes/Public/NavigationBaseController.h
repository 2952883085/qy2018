//
//  NavigationBaseController.h
//  qy2018
//
//  Created by zxy on 2018/3/30.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationBaseController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tabView;
@end
