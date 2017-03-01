//
//  STWheelsViewController.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/1/21.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STWheelsVC.h"
#import "ZJScrollPageView.h"
#import "STWheel.h"
#import "Chameleon.h"
#import "STGitHubTrending.h"

#import "STGithubMainVC.h"
#import "STWheelUIMainVC.h"
#import "STWheelPictureMainVC.h"
#import "STWheelVoiceMainVC.h"
#import "STWheelVideoMainVC.h"
#import "STQRCodeMainVC.h"
#import "STWheelNetworkMainVC.h"
#import "STDocumentMainVC.h"
@interface STWheelsVC ()
@property (nonatomic,strong) NSMutableArray *wheelsArray;
@end

@implementation STWheelsVC


- (NSMutableArray *)wheelsArray{
    if (_wheelsArray == nil) {
        _wheelsArray = [NSMutableArray arrayWithCapacity:8];
        NSArray *titleArray = @[@"Github框架",@"UI",@"图像处理",@"声音",@"视频",@"二维码",@"网络",@"文档"];
        NSArray *controllerArray = @[[STGithubMainVC class],[STWheelUIMainVC class],[STWheelPictureMainVC class],[STWheelVoiceMainVC class],[STWheelVideoMainVC class],[STQRCodeMainVC class],[STWheelNetworkMainVC class],[STDocumentMainVC class]];
        for (NSInteger i = 0; i < titleArray.count; i++) {
            STWheel *wheel = [[STWheel alloc] init];
            wheel.title = titleArray[i];
            wheel.controller = controllerArray[i];
            [_wheelsArray addObject:wheel];
        }
    }
    return _wheelsArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //必要的设置, 如果没有设置可能导致内容显示不正常
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = YES;
    [self setUpScrollPageView];
    [self setUpNavigationItem];
}

#pragma mark - private Method
- (void)setUpNavigationItem{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"排行" style:UIBarButtonItemStyleDone target:self action:@selector(jumpToGihubTrending)];
    self.navigationItem.rightBarButtonItem = item;
}

//跳转到git排行
- (void)jumpToGihubTrending{
    STGitHubTrending *rangVC = [[STGitHubTrending alloc]init];
    rangVC.title = @"GitHub排行";
    rangVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:rangVC animated:YES];
}

- (void)setUpScrollPageView{
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    // 缩放标题
    style.scaleTitle = YES;
    style.segmentBackgroundColor = [UIColor flatGreenColor];
    style.segmentBottomLineColor = [UIColor flatGreenColor];
    style.normalTitleColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    style.selectedTitleColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    // 颜色渐变
    style.gradualChangeTitleColor = YES;
    // 设置附加按钮的背景图片
    // 设置子控制器 --- 注意子控制器需要设置title, 将用于对应的tag显示title
    NSArray *childVcs = [NSArray arrayWithArray:[self setupChildVCAndTitle]];
    // 初始化
    ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 64.0, self.view.bounds.size.width, self.view.bounds.size.height - 64.0) segmentStyle:style childVcs:childVcs parentViewController:self];
    [self.view addSubview:scrollPageView];
}

- (NSArray *)setupChildVCAndTitle {
    NSMutableArray *controllerArray = [[NSMutableArray alloc]initWithCapacity:10];
    for (STWheel *wheel in self.wheelsArray) {
        Class controller = wheel.controller;
        UIViewController *VC = [[controller alloc] init];
        VC.title = wheel.title;
        [controllerArray addObject:VC];
        
    }
    return controllerArray;
}
@end
