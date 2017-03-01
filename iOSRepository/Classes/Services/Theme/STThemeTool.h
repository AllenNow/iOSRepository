//
//  STThemeTool.h
//  iOSRepository
//
//  Created by Swift Gao on 2017/2/3.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ThemeType) {
    ThemeTypeZhongqiu,
    ThemeTypeGuoqing,
    ThemeTypeChunjie
};

typedef NS_ENUM(NSInteger, ColorType) {
    ColorTypeLableForeColor,
    ColorTypeButtonColor
};

typedef NS_ENUM(NSInteger, ImageType) {
    ImageTypeBack,
    ImageTypeIcon,
};
@interface STThemeTool : NSObject
+ (void)save:(ThemeType)type;
+ (UIImage *)getImage:(ImageType)imageType;
+ (UIColor *)getColor:(ColorType)type;
@end
