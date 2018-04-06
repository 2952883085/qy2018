//
//  AppDelegate.m
//  qy2018
//
//  Created by zxy on 2018/3/27.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomTabBarController.h"
#import <UMCommon/UMCommon.h>
#import <UMCommonLog/UMCommonLogManager.h>
#import <UMAnalytics/MobClick.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    CustomTabBarController *tabBarCtl=[[CustomTabBarController alloc]init];
    self.window.rootViewController=tabBarCtl;
    
    //开发者需要显式的调用此函数，日志系统才能工作
    [UMCommonLogManager setUpUMCommonLogManager];
    /** 设置是否在console输出SDK的log信息.
     @param bFlag 默认NO(不输出log); 设置为YES, 输出可供调试参考的log信息. 发布产品时必须设置为NO.
     */
    [UMConfigure setLogEnabled:YES];//设置打开日志，
    //设置收集bug，默认为yes 开启
    [MobClick setCrashReportEnabled:YES];
    [UMConfigure initWithAppkey:um_APPkey channel:@"App Store"];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    NSLog(@"内存不够，需要清理内存");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
