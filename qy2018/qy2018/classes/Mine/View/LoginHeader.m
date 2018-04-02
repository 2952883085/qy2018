//
//  LoginHeader.m
//  qy2018
//
//  Created by zxy on 2018/4/2.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "LoginHeader.h"

@implementation LoginHeader

+(instancetype)loginHeader{
    UINib *nib = [UINib nibWithNibName:@"LoginHeader" bundle:nil];
    LoginHeader *header = [nib instantiateWithOwner:self options:nil][0];
    return header;
}

@end
