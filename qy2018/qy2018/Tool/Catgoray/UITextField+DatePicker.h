//
//  UITextField+DatePicker.h
//  CampusNetwork
//
//  Created by 2952883085 on 16/8/26.
//  Copyright © 2016年 foxconn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (DatePicker)

@property(nonatomic,assign)BOOL datePickerInput;//使用这个属性来设置UIDatePicker的键盘，只需要设置这个属性为yes

+(UIDatePicker *)sharedDatePicker;

@end
