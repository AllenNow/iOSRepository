//
//  STCoreImageViewController.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/1/22.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STCoreImageVC.h"
#import <UShareUI/UShareUI.h>
@interface STCoreImageVC ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation STCoreImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)valueChanged:(UISlider *)slider{
    UIImage *image = [UIImage imageNamed:@"fengjing.jpg"];
    static BOOL canChangeImage = YES;
    if (canChangeImage) {
        canChangeImage = NO;
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            CIContext *context = [CIContext contextWithOptions:nil];
            CIImage *ciImage = [CIImage imageWithCGImage:image.CGImage];
            CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
            [filter setValue:ciImage forKey:kCIInputImageKey];
            //设置模糊程度
            [filter setValue:[NSNumber numberWithFloat:slider.value] forKey: @"inputRadius"];
            CIImage *result = [filter valueForKey:kCIOutputImageKey];
            CGRect frame = [ciImage extent];
            NSLog(@"%f,%f,%f,%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
            CGImageRef outImage = [context createCGImage: result fromRect:ciImage.extent];
            UIImage * blurImage = [UIImage imageWithCGImage:outImage];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                _imageView.image = nil;
                _imageView.image = blurImage;
                canChangeImage = YES;
            });
        });
        
    }else{
        return;
    }
}
- (IBAction)code{
    NSURL *url = [ [ NSURL alloc ] initWithString: @"http://www.baidu.com" ];
    [[UIApplication sharedApplication] openURL:url options:@{UIApplicationOpenURLOptionsOpenInPlaceKey:@"1"} completionHandler:nil];
}

@end
