//
//  SettingFooterView.m
//  qiongyou
//
//  Created by fgnc on 2017/12/20.
//  Copyright © 2017年 foxconn. All rights reserved.
//

#import "SettingFooterView.h"

@implementation SettingFooterView

+(instancetype)settingFooterView{
    UINib *nib=[UINib nibWithNibName:@"SettingFooterView" bundle:nil];
    SettingFooterView *v=[nib instantiateWithOwner:self options:nil][0];
    v.frame=CGRectMake(0, 0, screenWidth, 100);
    return v;
}
@end
