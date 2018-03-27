//
//  NSString+changeStrColor.m
//  穷游
//
//  Created by fgnc on 2017/4/13.
//  Copyright © 2017年 foxconn富士康. All rights reserved.
//

#import "NSString+changeStrColor.h"

@implementation NSString (changeStrColor)
+(NSMutableAttributedString *)changeStrColorStr:(NSString *)string Location:(NSInteger)startLocation andLength:(NSInteger)length color:(UIColor *)color{
    NSMutableAttributedString *mutabStr=[[NSMutableAttributedString alloc]initWithString:string];
    [mutabStr addAttributes:@{NSForegroundColorAttributeName:color} range:NSMakeRange(startLocation, length)];
    return mutabStr;
}
@end
