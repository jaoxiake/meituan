//
//  AppDelegate.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/7/30.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "AppDelegate.h"
#import "WJShopController.h"
#import "WJNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //创建窗口
    _window =[[UIWindow alloc] init];
    
    //创建shop控制器
    WJShopController *shopVc = [[WJShopController alloc]init];
    
    //创建根控制器
    WJNavigationController *nav = [[WJNavigationController alloc]initWithRootViewController:shopVc];
    
    //指定根控制器
    _window.rootViewController = nav;
    
    //让窗口成为主窗口并可视
    [_window makeKeyAndVisible];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
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
