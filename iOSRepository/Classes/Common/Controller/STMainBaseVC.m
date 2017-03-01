//
//  STMainBaseVC.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/2/8.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STMainBaseVC.h"

@interface STMainBaseVC ()<UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSString *cellIdentifier;
@end

@implementation STMainBaseVC

#pragma mark - lazy
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:self.cellIdentifier];
        
    }
    return _tableView;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSString *)cellIdentifier{
    if (_cellIdentifier == nil) {
        _cellIdentifier = NSStringFromClass([self class]);
    }
    return _cellIdentifier;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier];
    STMainModel *model = _dataArray[indexPath.row];
    cell.textLabel.text = model.title;
    cell.imageView.image =model.image;
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    STMainModel *model = _dataArray[indexPath.row];
    Class controller = model.controller;
    UIViewController *VC = [[controller alloc]init];
    VC.title = model.title;
    [self.navigationController pushViewController:VC animated:YES];
}


@end
