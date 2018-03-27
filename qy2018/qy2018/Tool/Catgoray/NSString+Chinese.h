//
//  NSString+Chinese.h
//  判断字符串是否是中文
//
//  Created by fgnc on 2017/4/21.
//  Copyright © 2017年 foxconn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Chinese)
- (BOOL)isChinese;//判断是否是纯汉字

- (BOOL)includeChinese;//判断是否含有汉字


-(BOOL)PureLetters:(NSString*)str;//判断字符串是否为纯英文
@end
