//
//  STMainViewController.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/1/21.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STMainVC.h"
#import "STNavigationController.h"
#import "STStructureVC.h"
#import "STWheelsVC.h"
#import "STBlogVC.h"
#import "UIImage+originalImage.h"
#import "Chameleon.h"
@interface STMainVC ()

@end

@implementation STMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildViewControllers];
    [self setUpTabBarAppearance];
    
}

- (void)setUpTabBarAppearance{

//    self.tabBar.barTintColor = [UIColor flatGreenDarkColor];
//设置选中图标字体渲染颜色
    self.tabBar.tintColor = [UIColor flatGreenColor];
//设置未选中图标字体渲染颜色
//    self.tabBar.unselectedItemTintColor = [UIColor whiteColor];
//    self.tabBar.translucent = NO;
}

- (void)setUpChildViewControllers{
    STStructureVC *structureVC = [[STStructureVC alloc]init];
    [self addOneChildViewController:structureVC title:@"知识体系" image:[UIImage imageNamed:@"tabbar_icon_structure"]selectedImage:[UIImage imageNamed:@"tabbar_icon_structure"]];
    STWheelsVC *wheelsVC = [[STWheelsVC alloc]init];
    [self addOneChildViewController:wheelsVC title:@"常用框架" image:[UIImage imageNamed:@"tabbar_icon_wheels"]selectedImage:[UIImage imageNamed:@"tabbar_icon_wheels"]];
    STBlogVC *blogVC = [[STBlogVC alloc]init];
    [self addOneChildViewController:blogVC title:@"博文" image:[UIImage imageNamed:@"tabbar_icon_blog"] selectedImage:[UIImage imageNamed:@"tabbar_icon_blog"]];
}

//添加一个子控制器
- (void)addOneChildViewController:(UIViewController *)controller title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage{
    controller.title = title;
    controller.tabBarItem.image = image;
    controller.tabBarItem.selectedImage = selectedImage;
    STNavigationController *nav = [[STNavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:nav];
   
}


@end
