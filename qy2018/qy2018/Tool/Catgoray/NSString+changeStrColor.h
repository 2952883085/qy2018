//
//  NSString+changeStrColor.h
//  穷游
//
//  Created by fgnc on 2017/4/13.
//  Copyright © 2017年 foxconn富士康. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSString (changeStrColor)
/*改变labe局部文字颜色*/
+(NSMutableAttributedString *)changeStrColorStr:(NSString *)string Location:(NSInteger)startLocation andLength:(NSInteger)length color:(UIColor *)color;
@end
