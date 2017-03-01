//
//  STMainBaseVC.h
//  iOSRepository
//
//  Created by Swift Gao on 2017/2/8.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STMainModel.h"
@interface STMainBaseVC : UIViewController<UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *dataArray;
@end
