//
//  STMediaMainVC.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/2/8.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STMediaMainVC.h"

#import "STTextMainVC.h"
#import "STSensorMainVC.h"
#import "STTouchIDMainVC.h"
#import "ST3DTouchMainVC.h"
#import "STVideoMainVC.h"
#import "STVoiceMainVC.h"
#import "STPictureMainVC.h"
#import "STLocationMainVC.h"

@interface STMediaMainVC ()

@end

@implementation STMediaMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titleArray = @[@"文本",@"图片",@"声音",@"视频",@"定位",@"指纹",@"3DTouch",@"感应器"];
    NSArray *controllerArray = @[[STTextMainVC class],[STPictureMainVC class],[STVoiceMainVC class],[STVideoMainVC class],[STLocationMainVC class],[STTouchIDMainVC class],[ST3DTouchMainVC class],[STSensorMainVC class]];
    for (NSInteger i = 0; i < titleArray.count; i++) {
        STMainModel *model = [[STMainModel alloc] init];
        model.title = titleArray[i];
        model.controller = controllerArray[i];
        [self.dataArray addObject:model];
    }
    
}


@end
