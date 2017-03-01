//
//  STDateVC.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/2/23.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STDateVC.h"

@interface STDateVC ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *label7;
@property (weak, nonatomic) IBOutlet UILabel *label8;
@property (weak, nonatomic) IBOutlet UILabel *label9;
@property (weak, nonatomic) IBOutlet UILabel *label10;
@property (weak, nonatomic) IBOutlet UILabel *label11;
@property (weak, nonatomic) IBOutlet UILabel *label12;
@property (weak, nonatomic) IBOutlet UILabel *label13;
@property (weak, nonatomic) IBOutlet UILabel *label14;
@property (weak, nonatomic) IBOutlet UILabel *label15;


@end

@implementation STDateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpLabelTime];
    [self outPutDifferentLocal];
}

- (void)outPutDifferentLocal{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    dateFormatter.dateStyle = NSDateFormatterFullStyle;
    dateFormatter.timeStyle = NSDateFormatterFullStyle;
    
    //中国
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CH"];
    NSLog(@"中国：%@", [dateFormatter stringFromDate:date]); //

    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSLog(@"美国：%@", [dateFormatter stringFromDate:date]);//
    
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_UK"];
    NSLog(@"英国：%@", [dateFormatter stringFromDate:date]); //

    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"fr_FR"];
    NSLog(@"法国：%@", [dateFormatter stringFromDate:date]); //

    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    NSLog(@"日本：%@", [dateFormatter stringFromDate:date]); //

}

- (void)setUpLabelTime{
    NSDate *date = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CH"];
    //    NSDateFormatterNoStyle
    //    NSDateFormatterShortStyle
    //    NSDateFormatterMediumStyle
    //    NSDateFormatterLongStyle
    //    NSDateFormatterFullStyle
    
    dateFormatter.dateStyle = NSDateFormatterFullStyle;
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    
    _label1.text = [dateFormatter stringFromDate:date];
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    
    _label2.text = [dateFormatter stringFromDate:date];
    dateFormatter.timeStyle = NSDateFormatterMediumStyle;
    
    _label3.text = [dateFormatter stringFromDate:date];
    dateFormatter.timeStyle = NSDateFormatterLongStyle;
    
    _label4.text = [dateFormatter stringFromDate:date];
    dateFormatter.timeStyle = NSDateFormatterFullStyle;
    _label5.text = [dateFormatter stringFromDate:date];
    
    dateFormatter.timeStyle = NSDateFormatterFullStyle;
    dateFormatter.dateStyle = NSDateFormatterNoStyle;
    
    
    _label6.text = [dateFormatter stringFromDate:date];
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    
    _label7.text = [dateFormatter stringFromDate:date];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    
    _label8.text = [dateFormatter stringFromDate:date];
    dateFormatter.dateStyle = NSDateFormatterLongStyle;
    
    _label9.text = [dateFormatter stringFromDate:date];
    dateFormatter.dateStyle = NSDateFormatterFullStyle;
    _label10.text = [dateFormatter stringFromDate:date];
    
    
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    dateFormatter.dateStyle = NSDateFormatterNoStyle;
    _label11.text = [dateFormatter stringFromDate:date];
    
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    _label12.text = [dateFormatter stringFromDate:date];
    
    dateFormatter.timeStyle = NSDateFormatterMediumStyle;
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    _label13.text = [dateFormatter stringFromDate:date];
    
    dateFormatter.timeStyle = NSDateFormatterLongStyle;
    dateFormatter.dateStyle = NSDateFormatterLongStyle;
    _label14.text = [dateFormatter stringFromDate:date];
    
    dateFormatter.timeStyle = NSDateFormatterFullStyle;
    dateFormatter.dateStyle = NSDateFormatterFullStyle;
    _label15.text = [dateFormatter stringFromDate:date];
}


@end
