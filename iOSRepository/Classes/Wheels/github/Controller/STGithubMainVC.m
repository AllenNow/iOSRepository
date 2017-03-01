//
//  STGithubMainVC.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/2/9.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STGithubMainVC.h"

@interface STGithubMainVC ()

@end

@implementation STGithubMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    NSURL *url = [NSURL URLWithString:@"https://github.com/Tim9Liu9/TimLiu-iOS"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
}
@end
