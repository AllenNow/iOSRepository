//
//  STMarkdownVC.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/2/8.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STMarkdownVC.h"
#import "STMarkdownView.h"
@implementation STMarkdownVC

- (void)viewDidLoad{
    STMarkdownView *mardowmView = [STMarkdownView markdownViewWithtFrame:self.view.bounds markdownFile:_filePath];
    [self.view addSubview:mardowmView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"清除缓存" style:UIBarButtonItemStyleDone target:self action:@selector(cleanCacheAndCookie)];
}

/**清除缓存和cookie*/
- (void)cleanCacheAndCookie{
    //清除cookies
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies]){
        [storage deleteCookie:cookie];
    }
    //清除UIWebView的缓存
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    NSURLCache * cache = [NSURLCache sharedURLCache];
    [cache removeAllCachedResponses];
    [cache setDiskCapacity:0];
    [cache setMemoryCapacity:0];
}

@end
