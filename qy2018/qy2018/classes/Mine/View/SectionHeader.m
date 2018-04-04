//
//  SectionHeader.m
//  qy2018
//
//  Created by zxy on 2018/4/4.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "SectionHeader.h"

@implementation SectionHeader

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = [UIColor whiteColor];
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 200,30)];
        lab.font = [UIFont systemFontOfSize:14];
        lab.textColor = [UIColor blackColor];
        [self.contentView addSubview:lab];
        self.sectionTitle = lab;
    }
    return self;
}
@end
