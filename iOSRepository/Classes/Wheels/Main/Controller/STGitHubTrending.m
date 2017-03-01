//
//  STGitHubRankVC.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/2/9.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STGitHubTrending.h"

@interface STGitHubTrending ()

@end

@implementation STGitHubTrending

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    NSURL *url = [NSURL URLWithString:@"https://github.com/trending"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
}



@end
