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

@implementation entryModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"mid",@"feed.enter":@"enter"}];
}
@end

@implementation RecommendModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
@end
