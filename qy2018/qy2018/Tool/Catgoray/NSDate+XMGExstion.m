//
//  NSDate+XMGExstion.m
//  NSCalender日历对象分类
//
//  Created by fgnc on 2016/11/14.
//  Copyright © 2016年 foxconn. All rights reserved.
//

#import "NSDate+XMGExstion.h"
#import "NSCalendar+XMGExstion.h"
@interface NSDate()

//@property(nonatomic,strong)NSCalendar *calendar;

@end
@implementation NSDate (XMGExstion)

- (instancetype)init
{
    self = [super init];
    if (self) {
       // self.calendar=[NSCalendar sharedCalendar];

    }
    return self;
}
#pragma mark -get 方法判断是否是今年
-(BOOL)isThisYear{
    
    NSDateFormatter *fmt=[[NSDateFormatter alloc]init];
    [fmt setDateFormat:@"yyyy"];
    
    NSString *selfYear=[fmt stringFromDate:self];
    NSString *currentYear=[fmt stringFromDate:[NSDate date]];
    
    return selfYear==currentYear;
}

#pragma mark -get 方法判断是否是今天
-(BOOL)isToday{
//    NSDateFormatter *fmt=[[NSDateFormatter alloc]init];
//    [fmt setDateFormat:@"yyyy-MM-dd"];
    
//    //当前时间
//    NSDate *currentDate=[NSDate date];
    NSCalendar *calendar=[NSCalendar sharedCalendar];
        return   [calendar isDateInToday:self];
    
//    NSCalendarUnit unit=NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
//    
//    //self是谁调用这个方法就是谁
//   NSDateComponents *components= [calendar components:unit fromDate:self toDate:currentDate options:0];
//    
//    return components.year==0&&components.month==0&&components.day==0;
}

#pragma mark -get 方法判断是否是昨天
-(BOOL)isYesterday{
    NSCalendar *canlendar=[NSCalendar sharedCalendar];
    return [canlendar isDateInYesterday:self];
}


@end
