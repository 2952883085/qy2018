//
//  CachingController.h
//  明星衣橱
//
//  Created by 2952883085 on 16/8/31.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CachingController : UIViewController
//获取单个文件大小
+(long long) fileSizeAtPath:(NSString*) filePath;
//获取文件夹大小
+(float ) folderSizeAtPath:(NSString*) folderPath;
+(void)clearCache:(NSString *)path;

// 获取沙盒Document的文件目录
+ (NSString *)getDocumentDirectory;
// 获取沙盒Library的文件目录
+ (NSString *)getLibraryDirectory;
// 获取沙盒Library/Caches的文件目录
+ (NSString *)getCachesDirectory;
// 获取沙盒Preference的文件目录
+ (NSString *)getPreferencePanesDirectory;
// 获取沙盒tmp的文件目录
+ (NSString *)getTmpDirectory;

@end
