```sequence
Swift->iOS: Says Hello
iOS-->Swift: How are you?
```
[TOC]

##导航条的效果
- 标题设置

```
self.navigationItem.title = @"标题";
```
正常情况下，控制器的标题会默认作为导航标题

- 前景色

```
 self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
```

- 背景色

```
//注意上层有毛玻璃遮挡
self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
```
- 背景图

```
[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Background"] forBarMetrics:UIBarMetricsDefault];
```

- 状态栏字体颜色和隐藏

在iOS7之前
```
[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent]; 
[[UIApplication sharedApplication] setStatusBarHidden:YES];
```
iOS7之后

```
- (UIStatusBarStyle)preferredStatusBarStyle {  
    return UIStatusBarStyleLightContent;  
}  
  
- (BOOL)prefersStatusBarHidden {  
    return YES;  
} 
```
若iOS7之后仍要使用第一种方法全局设置，则需要在plist文件中添加`View controller-based status bar appearance` 字段，值为`NO`  ，意为不使用控制器管理状态栏。

- 设置返回按钮

```
//只设置颜色
self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
```
```
//设置成图片
UIImage *leftButtonImage = [[UIImage imageNamed:@"image"]
                               imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                            
self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftButtonImage
 style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
```

```
//设置成文字
self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回"style:UIBarButtonItemStylePlain target:self action:@selector(back)];
```

```
//自定义视图
self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
```
- 修复navigationController侧滑手势失效的问题

```
self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
 // 控制手势在根控制器时不触发
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return self.childViewControllers.count > 1;
}
```


- 导航栏透明和底部分隔线

```
//设置透明的背景图，便于识别底部线条有没有被隐藏
[navigationBar setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
//此处使底部线条透明
[navigationBar setShadowImage:[UIImage new]];
```

另外可以通过颜色转图片来修改导航条底部分隔线颜色

```
//动态地改变UIColor的alpha属性可以返回，不同alpha的图片；可用于动态改变导航条的透明度
+ (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

```

- 全局设置导航栏外观

```
//全局设置导航栏主题,只在AppDelegate中有效，
或者是UINavagaitonController中的RootController 中设置有效
- (void)setNavigationControllerAppearance {
    [UINavigationBar appearance].barStyle  = UIBarStyleBlack;
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithWhite:0.1 alpha:0.5]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
}

//也可以设置成图片
[[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav"] forBarMetrics:UIBarMetricsDefault];
[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav"]  forBarMetrics:UIBarMetricsDefault];
```

- 在导航栏上添加多个按钮

```
 //方法二
        UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
        leftButton.backgroundColor = [UIColor clearColor];
        leftButton.frame = CGRectMake(0, 0, 45, 40);
        [leftButton setImage:[UIImage imageNamed:@"LeftButton_back_Icon"] forState:UIControlStateNormal];
        [leftButton setTitle:@"返回" forState:UIControlStateNormal];
        leftButton.tintColor = [UIColor whiteColor];
        leftButton.autoresizesSubviews = YES;
        leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        leftButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin;
        [leftButton addTarget:self action:@selector(goToBack) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];

        self.navigationItem.leftBarButtonItems = @[backItem,closeItem];
```

- 隐藏导航栏

```
self.navigationController.navigationBar.hidden = YES;
```
- 导航栏的动态消失

```
if (scrollView.contentOffset.y > 64) {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}else{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
```
> 注意：两种方法都是可以隐藏导航栏的，隐藏之后依然可以使用push和pop方法。但是如果用navigationBar.hidden隐藏导航栏，我们可以继续使用navigationBarHidden提供的滑动pop效果，如果用navigationBarHidden，这个操作将无效；但前者navigationBar.hidden没有系统自动的动画效果。

- 状态栏的自适应问题

```
//不让其自动调整
self.automaticallyAdjustsScrollViewInsets = NO;
```

- [FDFullscreenPopGesture](https://github.com/forkingdog/FDFullscreenPopGesture) -- 一个丝滑的全屏滑动返回pop手势











  

