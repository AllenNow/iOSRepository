//
//  STStructureViewController.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/1/21.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

//轮播高度
#define CarouselHeight 220.f

#import "STStructureVC.h"
#import "Macro_UI.h"
#import "STMainCollectionViewCell.h"
#import "STCarouselView.h"

#import "STUIMainVC.h"
#import "STMediaMainVC.h"
#import "STNetWorkMainVC.h"
#import "STAnimationMainVC.h"
#import "STStorageMainVC.h"
#import "STTestMainVC.h"
#import "STThreadMainVC.h"
#import "STStructure.h"

@interface STStructureVC ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,assign) CGSize itemSize;
@property (nonatomic,strong) NSMutableArray *structureArray;
@property (nonatomic,strong) STCarouselView *carouselView;

@end

@implementation STStructureVC
static NSString *const cellIdentifier = @"collection";

- (CGSize)itemSize{
    if (CGSizeEqualToSize(_itemSize, CGSizeZero)) {
        _itemSize = CGSizeMake((kScreenWidth - 2)/3.0 -2,(kScreenWidth - 2)/3.0 -2);
    }
    return _itemSize;
}

- (NSMutableArray *)structureArray{
    if (_structureArray == nil) {
        _structureArray = [NSMutableArray arrayWithCapacity:8];
        NSArray *titleArray = @[@"UI",@"媒体",@"存储",@"动画",@"网络",@"线程",@"测试"];
        NSArray *controllerArray = @[[STUIMainVC class],[STMediaMainVC class],[STStorageMainVC class],[STAnimationMainVC class],[STNetWorkMainVC class],[STThreadMainVC class],[STTestMainVC class],];
        for (NSInteger i = 0; i < titleArray.count; i++) {
            STStructure *structure = [[STStructure alloc] init];
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"cell_background_structure_normal%zd.jpg",i]];
            
            structure.image = image;
            structure.title = titleArray[i];
            structure.controller = controllerArray[i];
            [_structureArray addObject:structure];
        }
    }
    return _structureArray;
}

- (void)viewWillAppear:(BOOL)animated{
    [self.carouselView beginTimer];
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpCarouselView];
    [self setUpCollectionView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return  UIStatusBarStyleLightContent;
}
- (void)viewWillDisappear:(BOOL)animated{
    [self.carouselView stopTimer];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)setUpCarouselView{
    NSArray *array = [NSArray arrayWithObjects:@"carousel_background_structure_normal0.jpg",@"carousel_background_structure_normal1.jpg",@"carousel_background_structure_normal2.jpg",@"carousel_background_structure_normal3.jpg",@"carousel_background_structure_normal4.jpg",@"carousel_background_structure_normal5.jpg", nil];
    STCarouselView *carouselView = [STCarouselView carouselViewWithtFrame:CGRectMake(0, 0, kScreenWidth, CarouselHeight) ImageArr:array AndImageClickBlock:^(NSInteger index) {
        
    }];
    [self.view addSubview:carouselView];
    _carouselView = carouselView;
}

- (void)setUpCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 2;
    //最小间距
    layout.minimumInteritemSpacing = 2;
    layout.itemSize = self.itemSize;
    layout.scrollDirection =  UICollectionViewScrollDirectionVertical;
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CarouselHeight, kScreenWidth, kScreenHeight - CarouselHeight)collectionViewLayout:layout];
    [collectionView registerClass:[STMainCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    _collectionView = collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    STMainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    STStructure *structure = self.structureArray[indexPath.row];
    
    cell.image = structure.image;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:structure.title];
//    [string addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithFloat:3.f] range:NSMakeRange(0, string.length)];
    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:50.f] range:NSMakeRange(0, string.length)];
    cell.textLabel.attributedText = string;
    cell.textLabel.highlightedTextColor = [UIColor blackColor];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    STStructure *structure = self.structureArray[indexPath.row];
    Class controller = structure.controller;
    UIViewController *VC = [[controller alloc] init];
    VC.title = structure.title;
    [self.navigationController pushViewController:VC animated:YES];
}



@end
