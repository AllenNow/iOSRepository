//
//  STCalouselIndicatorView.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/1/22.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STCalouselIndicatorView.h"

@interface STCalouselIndicatorView ()
@property (nonatomic,strong) UILabel *indicatorLabel;
@property (nonatomic,strong) UILabel *totalLabel;
@property (nonatomic,strong) UIImageView *indicatorImageView;
@property (nonatomic,assign) NSInteger oldCurrentPage;
@end

@implementation STCalouselIndicatorView
- (instancetype)init{
    if (self = [super init]) {
        [self setUpSubViews];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpSubViews];
    }
    return self;
}


- (void)setUpSubViews{
    _oldCurrentPage = 0;
    CGRect frame = self.frame;
    frame.size = CGSizeMake(103, IndicatorHeight);
    self.frame = frame;
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(IndicatorHeight, 0, 73, IndicatorHeight)];
    backImageView.image = [self bundleImageNamed:@"carousel_pageIndicatorTint_normal"];
    
    _indicatorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 2, IndicatorHeight - 4, IndicatorHeight - 4)];
    _indicatorImageView.image = [self bundleImageNamed:@"carousel_pageIndicator_normal"];
    
    
    
    UILabel *indicatorLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, IndicatorHeight - 4, IndicatorHeight - 4)];
    indicatorLabel.layer.masksToBounds = YES;
    indicatorLabel.layer.cornerRadius = 13;
    indicatorLabel.backgroundColor = [UIColor whiteColor];
    indicatorLabel.textColor = [UIColor orangeColor];
    indicatorLabel.textAlignment = NSTextAlignmentCenter;
    indicatorLabel.text = @"0";
    _indicatorLabel = indicatorLabel;
    
    
    UILabel *totalLabel = [[UILabel alloc] initWithFrame:backImageView.frame];
    _totalLabel = totalLabel;
    _totalLabel.textAlignment = NSTextAlignmentCenter;
    _totalLabel.textColor = [UIColor whiteColor];
    [self addSubview:backImageView];
    [_indicatorImageView addSubview:indicatorLabel];
    [self addSubview:totalLabel];
    [self addSubview:_indicatorImageView];
}

- (void)setCurrentPage:(NSInteger)currentPage{
    UIViewAnimationOptions option =_oldCurrentPage <= currentPage? UIViewAnimationOptionTransitionFlipFromRight:UIViewAnimationOptionTransitionFlipFromLeft;
    [UIView transitionWithView:_indicatorImageView duration:0.5f
            options:option
            animations:^ {
                _indicatorLabel.text = [NSString stringWithFormat:@"%zd",currentPage];
            }completion:nil];
    _oldCurrentPage = currentPage;
}

- (void)setNumberOfPages:(NSInteger)numberOfPages{
    _totalLabel.text = [NSString stringWithFormat:@"of %zd ",numberOfPages];
}

- (UIImage *)bundleImageNamed:(NSString *)name{
    NSString *bundleName = @"CarouselView.bundle/";
    NSString *fullPath = [[NSBundle mainBundle] pathForResource:name ofType:@"png" inDirectory:bundleName];
    UIImage *image = [UIImage imageNamed:fullPath];
    return image;
}

@end
