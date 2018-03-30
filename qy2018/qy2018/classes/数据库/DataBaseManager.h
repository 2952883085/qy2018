//
//  DataBaseManager.h
//  张先勇
//
//  Created by qianfeng on 15/12/12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBaseManager : NSObject
+(DataBaseManager *)sharedManager;

-(BOOL)insertDatas:(NSArray *)array;

-(BOOL)deleteDatas;

-(NSArray *)getAllDatas;
@end
