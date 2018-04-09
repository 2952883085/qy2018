//
//  SearchResultM.m
//  qy2018
//
//  Created by zxy on 2018/4/9.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "SearchResultM.h"

@implementation SearchResultM
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"mid"}];
}
@end
