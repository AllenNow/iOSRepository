//
//  AppDelegate.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/1/21.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "AppDelegate.h"
#import "STMainVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    STMainVC *mainVC = [[STMainVC alloc]init];
    _window.rootViewController = mainVC;
    [_window makeKeyAndVisible];
    return YES;
}


@end
