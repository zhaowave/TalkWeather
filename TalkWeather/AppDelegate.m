//
//  AppDelegate.m
//  TalkWeather
//
//  Created by kfzx-version on 2017/4/21.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
     MainTabBarViewController *mainTabBarViewController = [[MainTabBarViewController alloc] init];
    [_window setRootViewController:mainTabBarViewController];
    [_window makeKeyWindow];
    // Override point for customization after application launch.
    //[self changeNav];
    [self creatShortcutItem];
//    UIApplicationShortcutItem *shortcutItem = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
//    //如果是从快捷选项标签启动app，则根据不同标识执行不同操作，然后返回NO，防止调用- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
//    if (shortcutItem) {
//        //判断先前我们设置的快捷选项标签唯一标识，根据不同标识执行不同操作
//        if([shortcutItem.type isEqualToString:@"com.mycompany.myapp.one"]){
//            NSArray *arr = @[@"hello 3D Touch"];
//            UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:arr applicationActivities:nil];
//            [self.window.rootViewController presentViewController:vc animated:YES completion:^{
//            }];
//        } else if ([shortcutItem.type isEqualToString:@"com.mycompany.myapp.search"]) {//进入搜索界面
////            SearchViewController *childVC = [storyboard instantiateViewControllerWithIdentifier:@"searchController"];
////            [mainNav pushViewController:childVC animated:NO];
//        } else if ([shortcutItem.type isEqualToString:@"com.mycompany.myapp.share"]) {//进入分享界面
////            SharedViewController *childVC = [storyboard instantiateViewControllerWithIdentifier:@"sharedController"];
////            [mainNav pushViewController:childVC animated:NO];
//        }
//        return NO;
//    }
    
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

#pragma mark 3D touch methods
//创建应用图标上的3D touch快捷选项
- (void)creatShortcutItem {
    //创建系统风格的icon
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
    
    //创建快捷选项
    UIApplicationShortcutItem * item = [[UIApplicationShortcutItem alloc]initWithType:@"com.mycompany.myapp.share" localizedTitle:@"分享TalkWeather" localizedSubtitle:nil icon:icon userInfo:nil];
    
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeDate];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"other" localizedTitle:@"其他" localizedSubtitle:nil icon:icon2 userInfo:nil];
    //添加到快捷选项数组
    [UIApplication sharedApplication].shortcutItems = @[item,item2];
}
//
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    MainTabBarViewController *mainTabBarViewController = [[MainTabBarViewController alloc] init];
    [_window setRootViewController:mainTabBarViewController];
    [self.window makeKeyAndVisible];
    
    //判断先前我们设置的快捷选项标签唯一标识，根据不同标识执行不同操作
    if([shortcutItem.type isEqualToString:@"com.mycompany.myapp.one"]){
        NSArray *arr = @[@"hello 3D Touch"];
        UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:arr applicationActivities:nil];
        [self.window.rootViewController presentViewController:vc animated:YES completion:^{
        }];
    } else if ([shortcutItem.type isEqualToString:@"com.mycompany.myapp.share"]) {//进入分享
        NSLog(@"sharing...");
    } else {
        NSLog(@"other...");
    }
    
    if (completionHandler) {
        completionHandler(YES);
    }
}

/**
 *  全局改变Nav
 */
- (void)changeNav
{
    //设置NavigationBar背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:54 / 255.0
                                                                  green:53 / 255.0
                                                                   blue:58 / 255.0
                                                                  alpha:1]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName : [UIColor whiteColor]
                                                           }];
    //不设置这个无法修改状态栏字体颜色
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
}

@end
