//
//  AnimationLoadController.m
//  qy2018
//
//  Created by zxy on 2018/3/29.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "AnimationLoadController.h"

@interface AnimationLoadController ()

@end

@implementation AnimationLoadController

-(YYAnimationIndicator *)indicator{
    if(!_indicator){
        _indicator=[[YYAnimationIndicator alloc]initWithFrame:CGRectMake(screenWidth*0.5-50, screenHeight*0.5-50, 100, 100)];
        [self.view addSubview:_indicator];
    }
    return _indicator;
}


@end
