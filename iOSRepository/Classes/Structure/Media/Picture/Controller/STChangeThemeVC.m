//
//  STChangeThemeViewController.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/2/3.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STChangeThemeVC.h"
#import "STThemeTool.h"
@interface STChangeThemeVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation STChangeThemeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setImage];
    [self setLabelColor];
}
- (IBAction)chunjie:(id)sender {
    [STThemeTool save:ThemeTypeChunjie];
    [self setImage];
    [self setLabelColor];
}
- (IBAction)zhongqiu:(id)sender {
    [STThemeTool save:ThemeTypeZhongqiu];
    [self setImage];
    [self setLabelColor];
}
- (IBAction)guoqing:(id)sender {
    [STThemeTool save:ThemeTypeGuoqing];
    [self setImage];
    [self setLabelColor];
}

- (void)setImage{
    _imageView.image = [STThemeTool getImage:ImageTypeBack];
    [_btn setImage:[STThemeTool getImage:ImageTypeIcon] forState:UIControlStateNormal];
    
}
- (void)setLabelColor{
    _label.textColor = [STThemeTool getColor:ColorTypeLableForeColor];
    _btn.backgroundColor = [STThemeTool getColor:ColorTypeButtonColor];
}



@end
