//
//  AppDelegate.m
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import "AppDelegate.h"
#import "MHMineViewController.h"
#import "MHMainViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self FinishLaunchingWithOptions:launchOptions];
    [self thirdPartyConfigurationApplication:application didFinishLaunchingWithOptions:launchOptions];
    return YES;
}
- (void)FinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    /*初始化视图*/
    CGRect frame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame:frame];
    self.window.backgroundColor = [UIColor blackColor];
    self.window.rootViewController = self.slideVC;
    [self.window makeKeyAndVisible];
}
//第三方配置
- (void)thirdPartyConfigurationApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
}

- (MHSlideViewController *)slideVC{
    if (!_slideVC) {
      MHMineViewController *mineVC = [[MHMineViewController alloc]init];
        MHMainViewController *mainVC = [[MHMainViewController alloc]init];
        _slideVC = [[MHSlideViewController alloc]initWithLeftView:mineVC andMainView:mainVC];
        [_slideVC setPanEnabled:YES];
    }
    return _slideVC;
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
