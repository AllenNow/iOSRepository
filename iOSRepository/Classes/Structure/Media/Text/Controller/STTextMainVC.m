//
//  STTextMainVC.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/2/13.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STTextMainVC.h"
#import "STAttributeStringVC.h"
#import "STZZSRichVC.h"
#import "STDateVC.h"
@interface STTextMainVC ()

@end

@implementation STTextMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titleArray = @[@"富文本",@"ZSSRichTextEditor富文本",@"日期时间NSDate"];
    NSArray *controllerArray = @[[STAttributeStringVC class],[STZZSRichVC class],[STDateVC class]];
    for (NSInteger i = 0; i < titleArray.count; i++) {
        STMainModel *model = [[STMainModel alloc] init];
        model.title = titleArray[i];
        model.controller = controllerArray[i];
        [self.dataArray addObject:model];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    STMainModel *model = self.dataArray[indexPath.row];
    Class controller = model.controller;
    UIViewController *VC = [[controller alloc] init];
    VC.title = model.title;
    [self.navigationController pushViewController:VC animated:YES];
}

@end
