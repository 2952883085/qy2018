//
//  NSString+XMGPinyinChinese.h
//  Shop
//
//  Created by fgnc on 2017/2/13.
//  Copyright © 2017年 foxconn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XMGPinyinChinese)

/**************  将搜索结果转成英文  ***************/
+ (NSString *)transformToPinyin:(NSString *)aString;
/******  中文转拼音字母  *****/
+ (NSString *)transform:(NSString *)chinese;
@end
