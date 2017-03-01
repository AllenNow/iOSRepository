//
//  STMarkdownView.h
//  iOSRepository
//
//  Created by Swift Gao on 2017/2/7.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STMarkdownView : UIView
+(instancetype)markdownViewWithtFrame:(CGRect)frame
                         markdownFile:(NSString *)fullPath;
@end
