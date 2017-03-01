//
//  STThemeTool.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/2/3.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STThemeTool.h"
#define kTheme  @"theme"

@implementation STThemeTool

//获取主题颜色
+ (UIColor *)getColor:(ColorType)type{
    NSString *directory = [self getThemeDirectory];
    NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"ColorConfig.plist" ofType:nil inDirectory:directory];
    NSDictionary *dict = [[NSDictionary alloc]initWithContentsOfFile:fullPath];
    
    NSString *colorStr;
    switch (type) {
        case ColorTypeLableForeColor:
            colorStr = dict[@"labelFC"];
            break;
        case ColorTypeButtonColor:
            colorStr = dict[@"buttonColor"];
            break;
        default:
            colorStr = dict[@"labelFC"];
            break;
    }
    
    NSArray *colorArray = [colorStr componentsSeparatedByString:@","];
    if (colorArray.count < 3) {
        return nil;
    }
    
    NSInteger red = [colorArray[0] integerValue];
    NSInteger green = [colorArray[1] integerValue];
    NSInteger blue = [colorArray[2] integerValue];
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
}

+ (UIImage *)getImage:(ImageType)imageType{
    NSString *imageName;
    switch (imageType) {
        case ImageTypeBack:
            imageName = @"back";
            break;
        case ImageTypeIcon:
            imageName = @"icon";
            break;
        default:
            imageName = @"back";
            break;
    }
    NSString *directory = [self getThemeDirectory];
    imageName = [NSString stringWithFormat:@"%@/%@",directory,imageName];
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

+ (NSString *)getThemeDirectory{
    NSInteger themeType = [[[NSUserDefaults standardUserDefaults] objectForKey:kTheme] integerValue];
    NSString *themeDirectory;
    switch (themeType) {
        case ThemeTypeZhongqiu:
            themeDirectory = @"zhongqiu";
            break;
        case ThemeTypeGuoqing:
            themeDirectory = @"guoqing";
            break;
        case ThemeTypeChunjie:
            themeDirectory = @"chunjie";
            break;
        default:
            themeDirectory = @"chunjie";
            break;
    }
    NSString *directory = [NSString stringWithFormat:@"theme.bundle/%@",themeDirectory];
    return directory;
}

+ (void)save:(ThemeType)type{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:type] forKey:kTheme];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
