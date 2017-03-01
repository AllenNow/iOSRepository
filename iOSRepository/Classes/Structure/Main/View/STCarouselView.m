//
//  STCarouselView.m
//  SXscrollerPageView
//
//  Created by Swift Gao on 2016/12/14.
//  Copyright © 2016年 ShaoPro. All rights reserved.
//

//获取ScrollView的X值偏移量
#define contentOffSet_x self.scrollView.contentOffset.x
//获取ScrollView的宽度
#define frame_width self.scrollView.frame.size.width
//获取ScrollView的contentSize宽度
#define contentSize_x self.scrollView.contentSize.width

#import "STCarouselView.h"
#import "STCalouselIndicatorView.h"
@interface STCarouselView ()<UIScrollViewDelegate>
/**
 *  轮播的ScrollView
 */
@property(strong,nonatomic) UIScrollView * scrollView;
//@property(strong,nonatomic) UIPageControl *pageControl;

//轮播图片名字的数组
@property(strong,nonatomic) NSArray *imageArr;
//自定义视图的数组
@property(strong,nonatomic) NSArray *viewArr;
//定时器
@property(strong,nonatomic) NSTimer *timer;
//点击图片出发Block
@property(strong,nonatomic) imageClickBlock clickBlock;
@property(strong,nonatomic) STCalouselIndicatorView *calouselIndicatorView;
@end

@implementation STCarouselView

/**
 *  部分初始代码实现如下，
 */

#pragma mark 静态初始化方法
+ (instancetype)carouselViewWithtFrame:(CGRect)frame
                      ImageArr:(NSArray *)imageNameArray
            AndImageClickBlock:(imageClickBlock)clickBlock{

    return [[STCarouselView alloc] initWithtFrame:frame
                                       ImageArr:imageNameArray
                             AndImageClickBlock:clickBlock];
}

#pragma mark 默认初始化方法
- (instancetype)initWithtFrame:(CGRect)frame
                     ImageArr:(NSArray *)imageNameArray
           AndImageClickBlock:(imageClickBlock)clickBlock{
    
    if(self=[self initWithFrame:frame]){
        //设置ScrollView的contentSize
        self.scrollView.contentSize = CGSizeMake((imageNameArray.count+2)*frame_width,0);
        _calouselIndicatorView.numberOfPages = imageNameArray.count;
//        self.pageControl.numberOfPages = imageNameArray.count;
        
        //设置滚动图片数组
        self.imageArr=imageNameArray;
        
        //设置图片点击的Block
        self.clickBlock=clickBlock;
    }
    return self;
}

#pragma mark - 初始化方法重写
- (instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        //初始化轮播ScrollView
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.frame = self.bounds;
        _scrollView.scrollsToTop = NO;
        _scrollView.contentOffset=CGPointMake(frame_width, 0);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        [self addSubview:self.scrollView];
        
        STCalouselIndicatorView *calouselIndicatorView = [[STCalouselIndicatorView alloc]initWithFrame:CGRectMake(frame_width - 103, self.frame.size.height - IndicatorHeight - 10, 103, IndicatorHeight)];
        
        [self addSubview:calouselIndicatorView];
        _calouselIndicatorView = calouselIndicatorView;
       
        //初始化轮播页码控件
//        _pageControl=[[UIPageControl alloc]init];
//        //设置轮播页码的位置
//        _pageControl.frame=CGRectMake(0,self.frame.size.height - 30, self.frame.size.width, 30);
//        _pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0.569 green:0.808 blue:0.302 alpha:1.000];
//        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        
//        [self addSubview:self.pageControl];
        
        self.time = 3.0;
    }
    return self;
}

#pragma mark -定时器-
#pragma mark 初始化定时器
-(void)beginTimer{
    if(self.timer == nil){
        self.timer =[NSTimer scheduledTimerWithTimeInterval:self.time
                                                     target:self
                                                   selector:@selector(timerSel) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}
#pragma mark 摧毁定时器
-(void)stopTimer{
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark 定时器调用的方法
-(void)timerSel
{
    //获取并且计算当前页码
    CGPoint currentConOffSet = self.scrollView.contentOffset;
    currentConOffSet.x += frame_width;
    //动画改变当前页码
    [UIView animateWithDuration:0.5 animations:^{
        self.scrollView.contentOffset=currentConOffSet;
    }completion:^(BOOL finished) {
        [self updataWhenFirstOrLast];
    }];
}

#pragma mark 判断是否第一或者最后一个图片,改变坐标
- (void)updataWhenFirstOrLast{
    
    if(contentOffSet_x>=contentSize_x-frame_width){
    //当图片移动到最后一张时，动画结束移动到第二张图片的位置
        self.scrollView.contentOffset=CGPointMake(frame_width, 0);
    }else if (contentOffSet_x<=0){
    //当图片移动到第一张时，动画结束移动到倒数第二张的位置
        self.scrollView.contentOffset=CGPointMake(contentSize_x-2*frame_width, 0);
    }
    
    //更新PageControl
    [self updataPageControl];
}
#pragma mark 更新PageControl
- (void)updataPageControl{
    NSInteger index=(contentOffSet_x-frame_width)/frame_width;
    _calouselIndicatorView.currentPage = index;
//    _pageControl.currentPage=index;
}
/**
 *  我们也要使用到UIScrollViewDelegate，通过代理方法来控制轮播图的变化，和定时器开启与关闭！
 */
#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self beginTimer];
}

#pragma mark 结束滚动代理
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //当最后或者最前一张图片时改变坐标
    [self updataWhenFirstOrLast];
}


#pragma mark -=====================其他一些方法===================
#pragma mark轮播定时器时间
-(void)setTime:(CGFloat)time
{
    if(time>0)
    {
        _time = time;
        [self stopTimer];
        [self beginTimer];
    }
}

#pragma mark 重写图片名字的数组
-(void)setImageArr:(NSArray *)imageArr
{
    _imageArr=imageArr;
    
    [self addImageToScrollView];
    
    [self beginTimer];
}


#pragma mark 图片点击事件
-(void)imageClick:(UITapGestureRecognizer *)tap
{
    UIView *view=tap.view;
    if(self.clickBlock)
    {
        self.clickBlock(view.tag);
    }
}
/**
 *   很明显我们该如何实现图片的填充到轮播图上呢，那么通过下面的方法就可以了：
 */
#pragma mark 根据图片名添加图片到ScrollView
-  (void)addImageToScrollView{
    //创建一个可变数组
    NSMutableArray *imgMArr=[NSMutableArray arrayWithArray:self.imageArr];
    //添加第一个和最后一个对象到对应可变数组的最后一个位置和第一个位置
    [imgMArr insertObject:[self.imageArr lastObject] atIndex:0];
    [imgMArr addObject:[self.imageArr firstObject]];
    
    NSInteger tag = -1;
    if (imgMArr.count == 0){
        return;
    }
    for (NSInteger i = 0;i < imgMArr.count;i++){
        NSString *imageUrlStr  = imgMArr[i];
        //将传进来的图片名在本地初始化
        UIImageView *imgView= [[UIImageView alloc]initWithFrame:CGRectMake(frame_width*(tag+1), 0, frame_width, self.frame.size.height)];

        imgView.contentMode = UIViewContentModeScaleToFill;
        UIImage *image = [UIImage imageNamed:imageUrlStr];
        if (image != nil) {
            imgView.image = image;
        }
        //让图片进行裁剪显示
        imgView.contentMode = UIViewContentModeScaleToFill;
        //添加手势
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageClick:)];
        
        //开启用户交互
        imgView.userInteractionEnabled=YES;
        
        [self.scrollView addSubview:imgView];
        
        [imgView addGestureRecognizer:tap];
        
        //设置tag
        imgView.tag = tag;
        tag++;
    }
    _calouselIndicatorView.numberOfPages = self.imageArr.count;
//    _pageControl.numberOfPages = self.imageArr.count;
}


@end
