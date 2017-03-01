//
//  STControllersVC.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/2/10.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STControllersVC.h"
#import "STMarkdownVC.h"
@interface STControllersVC ()

@end

@implementation STControllersVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titleArray = @[@"TabBarController",@"NavigationController",@"多控制器"];
    for (NSInteger i = 0; i < titleArray.count; i++) {
        STMainModel *model = [[STMainModel alloc] init];
        model.title = titleArray[i];
        [self.dataArray addObject:model];
    }
//    
//    UINavigationBar *navigationBar = self.navigationController.navigationBar;
//    //设置透明的背景图，便于识别底部线条有没有被隐藏
//    [navigationBar setBackgroundImage:[[UIImage alloc] init]forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
//    //此处使底部线条失效
//    [navigationBar setShadowImage:[UIImage new]];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *filePath;
    switch (indexPath.row) {
        case 0:
            filePath = @"structure/UI/Controllers/TabBarController";
            break;
        case 1:
            filePath = @"structure/UI/Controllers/NavigationController";
            break;
        case 2:
            filePath = @"structure/UI/Controllers/MultiController";
            break;
        default:
            filePath = @"structure/UI/Controllers/NavigationController";
            break;
    }
    STMarkdownVC *markDownVC = [[STMarkdownVC alloc]init];
    markDownVC.filePath = filePath;
    [self.navigationController pushViewController:markDownVC animated:YES];
}


@end
