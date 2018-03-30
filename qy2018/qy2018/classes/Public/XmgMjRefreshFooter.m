//
//  XmgMjRefreshFooter.m
//  qy2018
//
//  Created by zxy on 2018/3/30.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "XmgMjRefreshFooter.h"

@implementation XmgMjRefreshFooter
-(void)prepare{
    [super prepare];
    NSMutableArray *images = [NSMutableArray array];
    NSArray *idleArray=@[@"Loading_0000",@"Loading_0001",@"Loading_0002",@"Loading_0003",@"Loading_0004",@"Loading_0005",@"Loading_0006",@"Loading_0007",@"Loading_0008",@"Loading_0009",@"Loading_0010",@"Loading_0011",@"Loading_0012"];
    for (NSInteger i = 0; i < idleArray.count; i++) {
        UIImage *image = [UIImage imageNamed:idleArray[i]];
        [images addObject:image];
    }
    //普通闲置状态
    [self setImages:images forState:MJRefreshStateIdle];
    //松开就可以刷新状态
    [self setImages:images forState:MJRefreshStatePulling];
    //正在刷新中状态
    [self setImages:images forState:MJRefreshStateRefreshing];
    
    self.refreshingTitleHidden = YES;
    self.stateLabel.hidden = YES;
}



@end
