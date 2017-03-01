//
//  STNavigationController.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/1/21.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STNavigationController.h"
#import "Chameleon.h"
@interface STNavigationController ()

@end

@implementation STNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor flatGreenColor];
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.titleTextAttributes =@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:20]};
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    // 当非根控制器隐藏底部tabbar
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //    NSLog(@"%ld",self.viewControllers.count);
    // 执行这一行代码将控制器压栈
    [super pushViewController:viewController animated:animated];
}

@end
