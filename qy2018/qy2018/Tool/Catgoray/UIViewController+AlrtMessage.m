//
//  UIViewController+AlrtMessage.m
//  CampusNetwork
//
//  Created by 2952883085 on 16/8/29.
//  Copyright © 2016年 foxconn. All rights reserved.
//

#import "UIViewController+AlrtMessage.h"

@implementation UIViewController (AlrtMessage)


-(void)setAlrtMessage:(NSString *)alrtMessage{
    UIAlertController *ctl=[UIAlertController alertControllerWithTitle:@"" message:alrtMessage preferredStyle:UIAlertControllerStyleAlert];
    
    //修改标题字体大小
//    NSMutableAttributedString *titleStr=[[NSMutableAttributedString alloc]initWithString:@"foxconnwifi.app"];
//    [titleStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:26] range:NSMakeRange(0, 15)];
//    //if([ctl valueForKey:@"attributedTitle"]){
//        [ctl setValue:titleStr forKey:@"attributedTitle"];
//    //}
    
    //设置message字体大小
    NSMutableAttributedString *messageStr=[[NSMutableAttributedString alloc]initWithString:alrtMessage];
    [messageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, alrtMessage.length)];
   // if([ctl valueForKey:@"attributedMessage"]){
        [ctl setValue:messageStr forKey:@"attributedMessage"];
   // }
    
    
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [ctl addAction:ok];
    [self presentViewController:ctl animated:YES completion:nil];
}

-(NSString *)alrtMessage{
    return  self.alrtMessage;
}


@end
