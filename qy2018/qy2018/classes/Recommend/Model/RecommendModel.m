//
//  RecommendModel.m
//  qy2018
//
//  Created by zxy on 2018/3/27.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "RecommendModel.h"

@implementation lunboModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
@end

@implementation authorM
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
@end

@implementation entryM
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"mid"}];
}

-(void)setTitle:(NSString *)title{
    _title = title;
    CGFloat height = [title boundingRectWithSize:CGSizeMake(screenWidth - 30, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
    _titleHeight = height;
}


-(void)setSubject:(NSString *)subject{
    _subject = subject;
    CGFloat height = [subject boundingRectWithSize:CGSizeMake(screenWidth - 20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
    _subjectHeight = height;
}

@end

@implementation feedM
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
@end

@implementation RecommendModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
@end
