//
//  UIView+ZXYAnimation.m
//  qiongyou
//
//  Created by fgnc on 2018/1/9.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "UIView+ZXYAnimation.h"

@implementation UIView (ZXYAnimation)

-(void)showEaseInOutAnimation{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.5];
    self.transform=CGAffineTransformMakeScale(1,1);
    [UIView commitAnimations];
}


-(void)hideEaseInOutAnimation{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.5];
    self.transform=CGAffineTransformMakeScale(0.0001, 0.0001);
    [UIView commitAnimations];
}
@end
