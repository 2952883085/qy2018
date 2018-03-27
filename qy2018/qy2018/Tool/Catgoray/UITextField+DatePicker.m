//
//  UITextField+DatePicker.m
//  CampusNetwork
//
//  Created by 2952883085 on 16/8/26.
//  Copyright © 2016年 foxconn. All rights reserved.
//

#import "UITextField+DatePicker.h"

@implementation UITextField (DatePicker)

+(UIDatePicker *)sharedDatePicker{
    static UIDatePicker *daterPicker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        daterPicker = [[UIDatePicker alloc] init];
        daterPicker.datePickerMode = UIDatePickerModeDate;
    });
    
    return daterPicker;
}
//set方法
-(void)setDatePickerInput:(BOOL)datePickerInput{
    if(datePickerInput){
        self.inputView=[UITextField sharedDatePicker];//设置输入view为datePicker
        [[UITextField sharedDatePicker] addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
}

#pragma mark -datePicker点击事件
- (void)datePickerValueChanged:(UIDatePicker *)sender
{

    if (self.isFirstResponder)//一定要判断textfield是不是第一响应者
    {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];//设置为中文
        sender.locale = locale;
        
        [formatter setDateFormat:@"yyyy-MM-dd"];
        self.text = [formatter stringFromDate:sender.date];//赋值textField
    }
//    else
//    {
//        self.inputView = nil;
//        [[UITextField sharedDatePicker] removeTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
//    }
}



//get 方法
-(BOOL)datePickerInput{
    return [self.inputView isKindOfClass:[UIDatePicker class]];
}
@end
