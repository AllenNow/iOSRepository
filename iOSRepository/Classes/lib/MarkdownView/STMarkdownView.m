//
//  STMarkdownView.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/2/7.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STMarkdownView.h"
#import "PINURLCache.h"
#import "MBProgressHUD.h"

@interface STMarkdownView ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic,strong) MBProgressHUD *hud;
@end

@implementation STMarkdownView

+ (instancetype)markdownViewWithtFrame:(CGRect)frame
                         markdownFile:(NSString *)fullPath{
    
    return [[STMarkdownView alloc]initWithFrame:frame markdownFile:fullPath];
}

- (instancetype)initWithFrame:(CGRect)frame markdownFile:(NSString *)fullPath{
    if(self = [self initWithFrame:frame]){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"markdown/index.html" ofType:nil inDirectory:@"markdown.bundle"];
        NSURL *url = [NSURL fileURLWithPath:path];
        
        NSString *fullUrlStr = [NSString stringWithFormat:@"%@?RDFile=../%@.md",url.absoluteString,fullPath];
        NSURL *fullUrl = [NSURL URLWithString:fullUrlStr];
        [_webView loadRequest:[NSURLRequest requestWithURL:fullUrl]];
        
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _webView.scrollView.bounces = NO;
        [self addSubview:_webView];
         _webView.delegate = self;
        
        // 缓存配置
        PINURLCache *URLCache = [[PINURLCache alloc] initWithMemoryCapacity:20 * 1024 * 1024 diskCapacity:200 * 1024 * 1024 diskPath:nil cacheTime:0];
        /**
         * @param URLCache -> 这里的 URLCache 即 [NSURLCache sharedURLCache] 获取的 URLCache
         */
        [PINURLCache setSharedURLCache:URLCache];
    }
    return self;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    _hud = [MBProgressHUD showHUDAddedTo:webView animated:YES];
    _hud.label.text = @"加载中...";
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_hud hideAnimated:YES];
}

@end
