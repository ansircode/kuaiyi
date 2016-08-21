//
//  AppDelegate.m
//  kuaiyi
//
//  Created by 许建安 on 16/8/17.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "AppDelegate.h"



@interface AppDelegate ()

@property (nonatomic, strong) MMDrawerController *drawerC;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //全局导航栏的背景图片
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav"] forBarMetrics:UIBarMetricsDefault];
    //全局导航栏字体颜色
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //全局导航栏渲染颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    //首页
    UINavigationController *centerNav = [[UINavigationController alloc] initWithRootViewController:[[XJFirstPageController alloc] init]];
    [centerNav setRestorationIdentifier:@"centerNav"];
    
    //左侧滑
    UINavigationController *leftNav = [[UINavigationController alloc] initWithRootViewController:[[XJOtherFunctionController alloc] init]];
    [leftNav setRestorationIdentifier:@"leftNav"];
    
    self.drawerC = [[MMDrawerController alloc] initWithCenterViewController:centerNav leftDrawerViewController:leftNav];
    [self.drawerC setShowsShadow:NO];
    [self.drawerC setRestorationIdentifier:@"MMDrawer"];
    //设置左页面宽度
    [self.drawerC setMaximumLeftDrawerWidth:200.0];
    //左右滑动
    [self.drawerC setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerC setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    
    self.window.rootViewController = self.drawerC;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
