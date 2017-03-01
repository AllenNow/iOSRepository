//
//  STUIMainVC.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/2/8.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STUIMainVC.h"
#import "STMainModel.h"
#import "STEventsVC.h"
#import "STViewsVC.h"
#import "STControllersVC.h"

@implementation STUIMainVC


- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titleArray = @[@"视图",@"控制器",@"事件"];
    NSArray *controllerArray = @[[STViewsVC class],[STControllersVC class],[STEventsVC class]];
    for (NSInteger i = 0; i < titleArray.count; i++) {
        STMainModel *model = [[STMainModel alloc] init];
        model.title = titleArray[i];
        model.controller = controllerArray[i];
        [self.dataArray addObject:model];
    }
}



@end
