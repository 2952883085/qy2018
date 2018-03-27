//
//  NSCalendar+XMGExstion.m
//  NSCalender日历对象分类
//
//  Created by fgnc on 2016/11/14.
//  Copyright © 2016年 foxconn. All rights reserved.
//

#import "NSCalendar+XMGExstion.h"

@implementation NSCalendar (XMGExstion)
+(instancetype)sharedCalendar{
    if([self respondsToSelector:@selector(calendarWithIdentifier:)]){//ios8.0以后
       return   [self calendarWithIdentifier:NSCalendarIdentifierGregorian];
    }
    else{//ios8.0以前
        return [self currentCalendar];
    }
}
@end
