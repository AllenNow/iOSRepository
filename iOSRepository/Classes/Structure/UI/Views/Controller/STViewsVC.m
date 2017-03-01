//
//  STViewsVC.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/2/10.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STViewsVC.h"

#import "STButtonVC.h"
#import "STLabelVC.h"
#import "STTextFieldVC.h"
#import "STTextViewVC.h"
#import "STScrollViewVC.h"
#import "STTableViewVC.h"
#import "STCollectionViewVC.h"
@interface STViewsVC ()

@end

@implementation STViewsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titleArray = @[@"Button",@"Label",@"TextField",@"TextView",@"ScrollView",@"TableView",@"CollectionView"];
    
    NSArray *controllerArray = @[[STButtonVC class],[STLabelVC class],[STTextFieldVC class],[STTextViewVC class],[STScrollViewVC class],[STTextViewVC class],[STCollectionViewVC class]];
    for (NSInteger i = 0; i < titleArray.count; i++) {
        STMainModel *model = [[STMainModel alloc] init];
        model.title = titleArray[i];
        model.controller = controllerArray[i];
        [self.dataArray addObject:model];
    }
}


@end
