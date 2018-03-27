//
//  NSString+TimeStamp.m
//  时间戳转时间
//
//  Created by fgnc on 2016/11/3.
//  Copyright © 2016年 foxconn. All rights reserved.
//

#import "NSString+TimeStamp.h"

@implementation NSString (TimeStamp)
+(NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    //设定时间格式，这里可以设置成自己需要的格式，HH:24小时制 hh:12
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSTimeInterval time=[timeString doubleValue]/1000.0;
    NSDate *detailDate=[NSDate dateWithTimeIntervalSince1970:time];
    NSString *currentDateStr=[dateFormatter stringFromDate:detailDate];
    return currentDateStr;
}
@end
