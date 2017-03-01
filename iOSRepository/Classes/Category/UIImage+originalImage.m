//
//  UIImage+originalImage.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/1/21.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "UIImage+originalImage.h"

@implementation UIImage (originalImage)
+ (UIImage *)originalImageNamed:(NSString *)name{
    UIImage *image = [UIImage imageNamed:name];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}
@end
