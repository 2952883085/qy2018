//
//  NSDate+String.m
//  DormNetwork
//
//  Created by fgnc on 2017/1/17.
//  Copyright © 2017年 foxconn. All rights reserved.
//

#import "NSDate+String.h"

@implementation NSDate (String)
+(NSString *)XMGStringFromDate:(NSDate *)date{
    NSDateFormatter *fmt=[[NSDateFormatter alloc]init];
    [fmt setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr=[fmt stringFromDate:date];
    return dateStr;
}
@end
