//
//  UITextField+changePlaceholder.m
//  qiongyou
//
//  Created by fgnc on 2017/12/18.
//  Copyright © 2017年 foxconn. All rights reserved.
//

#import "UITextField+changePlaceholder.h"

@implementation UITextField (changePlaceholder)
-(void)changePlaceholderTextColor:(UIColor *)color{
    [self setValue:color forKeyPath:@"placeholderLabel.textColor"];
}

-(void)changeTintColor:(UIColor *)color{
    self.tintColor=color;
}
@end
