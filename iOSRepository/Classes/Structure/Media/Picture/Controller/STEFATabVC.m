//
//  STEFATabViewController.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/1/22.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STEFATabVC.h"

@interface STEFATabVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UISwitch *switchBtn;

@property (nonatomic,strong) UIToolbar *toolBar;

@property (nonatomic,strong) UIVisualEffectView *effectView;
@end

@implementation STEFATabVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.switchBtn addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:beffect];
    effectView.frame = _imageView.frame;
    _effectView = effectView;
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:_imageView1.frame];
    toolBar.barStyle = UIBarStyleDefault;
    _toolBar = toolBar;
    [self.view addSubview:effectView];
    [self.view addSubview:toolBar];
}

- (void)valueChanged:(UISwitch *)switchBtn{
    if (switchBtn.isOn) {
        _effectView.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        _toolBar.barStyle = UIBarStyleBlack;
    }else{
        _effectView.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _toolBar.barStyle = UIBarStyleDefault;
    }
}

@end
