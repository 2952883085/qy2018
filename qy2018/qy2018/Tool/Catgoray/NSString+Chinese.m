//
//  NSString+Chinese.m
//  判断字符串是否是中文
//
//  Created by fgnc on 2017/4/21.
//  Copyright © 2017年 foxconn. All rights reserved.
//

#import "NSString+Chinese.h"

@implementation NSString (Chinese)
- (BOOL)isChinese
{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

- (BOOL)includeChinese
{
    for(int i=0; i< [self length];i++)
    {
        int a =[self characterAtIndex:i];
        if( a >0x4e00&& a <0x9fff){
            return YES;
        }
    }
    return NO;
}


-(BOOL)PureLetters:(NSString*)str{
    BOOL flag;
    if(str.length<=0){
        flag=NO;
        return flag;
    }
    NSString *regex=@"^[a-zA-Z0-9]$";
    NSPredicate *identityPredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [identityPredicate evaluateWithObject:str];
}





@end
