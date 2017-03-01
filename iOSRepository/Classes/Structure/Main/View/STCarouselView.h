//
//  STCarouselView.h
//  SXscrollerPageView
//
//  Created by Swift Gao on 2016/12/14.
//  Copyright © 2016年 ShaoPro. All rights reserved.
//

#import <UIKit/UIKit.h>
#define BasicBackGroundColor  [UIColor colorWithRed:102/255.0 green:51/255.0 blue:0/255.0 alpha:1]
#define ColorWithRGB(r,g,b,p)   [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:p]

#define ScreenHeight    [UIScreen mainScreen].bounds.size.height
#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
typedef void(^imageClickBlock)(NSInteger index);

@interface STCarouselView : UIView


// 轮播的时间
@property(assign,nonatomic) CGFloat time;

/**
 *  初始化图片轮播图方法
 *
 *  @param frame          坐标
 *  @param imageNameArray 图片数组
 *  @param clickBlock     点击事件的Block回调
 *
 *  @return 当前对象
 */
+(instancetype)carouselViewWithtFrame:(CGRect)frame
                      ImageArr:(NSArray *)imageNameArray
            AndImageClickBlock:(imageClickBlock)clickBlock;
//开始定时器
-(void)beginTimer;

//销毁定时器
-(void)stopTimer;
@end
