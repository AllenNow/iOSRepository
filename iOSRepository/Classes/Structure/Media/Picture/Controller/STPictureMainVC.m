//
//  STPhotoViewController.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/1/22.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STPictureMainVC.h"
#import "STVImageVC.h"
#import "STCoreImageVC.h"
#import "STEFATabVC.h"
#import "STChangeThemeVC.h"
@interface STPictureMainVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;

@end
static NSString  * const cellIdentifier = @"cellIdentifier";

@implementation STPictureMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图片处理";
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"vImage模糊";
                break;
            case 1:
                cell.textLabel.text = @"CoreImage模糊";
                break;
            case 2:
                cell.textLabel.text = @"UIBlurEffect和toolbar模糊";
                break;
            default:
                break;
        }
    }else if(indexPath.section == 1){
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"MarkDown";
                break;
            case 1:
                cell.textLabel.text = @"换肤";
                
            default:
                break;
        }
        
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *controller = nil;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                controller = [[STVImageVC alloc]init];
                break;
            case 1:
                controller = [[STCoreImageVC alloc]init];
                break;
            case 2:
               controller =  [[STEFATabVC alloc]init];
                break;
            case 3:
                
                break;
            case 4:
                
                break;
                
            default:
                break;
        }
    }else if(indexPath.section == 1){
        switch (indexPath.row) {
            case 0:

                break;
            case 1:
                controller =  [[STChangeThemeVC alloc]init];
            default:
                
                break;
        }
        
    }
    [self.navigationController pushViewController:controller animated:YES];
}

@end
