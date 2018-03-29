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
