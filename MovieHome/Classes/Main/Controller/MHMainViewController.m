//
//  MHMainViewController.m
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import "MHMainViewController.h"
#import "MHsegmentScrollView.h"
#import "MHContentViewController.h"
#import <SDCycleScrollView.h>
#import "AppDelegate.h"
#import "MHMainTopToolView.h"
#define CATEGORY  @[@"推荐",@"原创",@"热门",@"美食",@"生活",@"设计感",@"家居",@"礼物",@"阅读",@"运动健身",@"旅行户外"]
@interface MHMainViewController ()<UIScrollViewDelegate,MHsegmentScrollViewDelegate,SDCycleScrollViewDelegate>
@property (nonatomic, strong) MHMainTopToolView *topToolView;
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;//轮播
@property (nonatomic, strong) MHsegmentScrollView *segmentScrollView;//切换
@property (nonatomic, strong) UIScrollView *currentUIScrollView;
//
@property (nonatomic, strong) UIScrollView *bottomScrollView;
//存放控制器
@property (nonatomic, strong)NSMutableArray *controlleres;
//记录上一个偏移量
@property (nonatomic, assign) CGFloat lastCollectionViewOffsetY;
//存放scrollViews
@property(nonatomic,strong)NSMutableArray *scrollViews;
//vc
@property (nonatomic, strong) MHContentViewController *contentVC;

@end

@implementation MHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    // Do any additional setup after loading the view.
}
- (void)initUI{
    _controlleres = [NSMutableArray array];
    _scrollViews = [NSMutableArray array];
    [self.view addSubview:self.bottomScrollView];
    
    [self.view addSubview:self.cycleScrollView];
    [self.view addSubview:self.topToolView];
    [self.view addSubview:self.segmentScrollView];
    self.segmentScrollView.tagArray = CATEGORY;
    [self.bottomScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    NSMutableArray *images = [NSMutableArray array];
    for (NSInteger i = 1; i<=8; i++) {
        NSString *imageName = [NSString stringWithFormat:@"cycle_0%ld",(long)i];
        [images addObject:imageName];
    }
    self.cycleScrollView.localizationImageNamesGroup = images;
    
}
#pragma mark -- MHsegmentScrollViewDelegate
- (void)didClickBtnTitlt:(NSString *)title index:(NSInteger)ondex first:(BOOL)first{
    [self clickSegmentIndex:ondex];
}
- (void)clickSegmentIndex:(NSInteger)index{
   
      [self resetScrollOffset];
}
#pragma observe 监听collection滚动
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    UIScrollView *scrollView = (UIScrollView *)object;
    
    if (![keyPath isEqualToString:@"contentOffset"]) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    CGFloat scrollffsetY = scrollView.contentOffset.y;
    
    self.lastCollectionViewOffsetY = scrollffsetY;
    if ( scrollffsetY>0 && scrollffsetY<= DISTANCE) {
        self.segmentScrollView.frame = CGRectMake(0, kMainHeaderHeight-scrollffsetY, kScreenWidth, Get375Width(40));
        self.cycleScrollView.frame = CGRectMake(0, -scrollffsetY, kScreenWidth, kMainHeaderHeight);
    }else if( scrollffsetY < 0){
        self.segmentScrollView.frame = CGRectMake(0, kMainHeaderHeight, kScreenWidth, Get375Width(40));
        self.cycleScrollView.frame = CGRectMake(0, 0, kScreenWidth, kMainHeaderHeight);
    }else if (scrollffsetY > DISTANCE){
        self.segmentScrollView.frame = CGRectMake(0,kMainTopToolHeight, kScreenWidth, Get375Width(40));
        self.cycleScrollView.frame = CGRectMake(0, -kMainHeaderHeight, kScreenWidth, kMainHeaderHeight);
    }
    [self.topToolView scrollOffsetY:scrollffsetY];
}
#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.bottomScrollView) {
        int index =  scrollView.contentOffset.x/scrollView.frame.size.width;
         self.currentUIScrollView  = self.scrollViews[index];
        [self.segmentScrollView scrollDidIndex:index];
        [self resetScrollOffset];
    }
}
#pragma mark -- 改变scrollview的offset
- (void)resetScrollOffset{
        for (UIScrollView *scrollView in self.scrollViews) {
            if ( self.lastCollectionViewOffsetY>=0 &&  self.lastCollectionViewOffsetY<=kMainHeaderHeight) {
                scrollView.contentOffset = CGPointMake(0,  self.lastCollectionViewOffsetY);
            }else if(self.lastCollectionViewOffsetY < 0){
                scrollView.contentOffset = CGPointMake(0, 0);
            }else if ( self.lastCollectionViewOffsetY > kMainHeaderHeight){
                scrollView.contentOffset = CGPointMake(0, kMainHeaderHeight);
            }
        }
}

#pragma mark -- SDCycleScrollViewDelegate
#pragma mark -- 图片点击回调
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    
}
#pragma mark -- 点击图片回调
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}
#pragma mark -- UI
- (UIScrollView *)bottomScrollView{
    if (!_bottomScrollView) {
        _bottomScrollView = [UIScrollView new];
        _bottomScrollView.pagingEnabled = YES;
        _bottomScrollView.delegate = self;
        for (NSInteger i = 0; i<CATEGORY.count; i++) {
            _contentVC = [MHContentViewController new];
            [_bottomScrollView addSubview:_contentVC.view];
            [_controlleres addObject:_contentVC];
            [_scrollViews addObject:_contentVC.contentScrollView];
            [_contentVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(i*KscreenWidth);
                make.top.mas_equalTo(self->_bottomScrollView);
                make.height.mas_equalTo(self->_bottomScrollView);
                make.width.mas_equalTo(KscreenWidth);
            }];
            [_contentVC.contentScrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        }
        self.currentUIScrollView = self.scrollViews[0];
        _bottomScrollView.contentSize = CGSizeMake(KscreenWidth*CATEGORY.count, 0);
        
    }
    return _bottomScrollView;
}
#pragma mark -- topToolView
- (MHMainTopToolView *)topToolView{
    if (!_topToolView) {
        _topToolView = [[MHMainTopToolView alloc]initWithFrame:CGRectMake(0, 0, KscreenWidth, kMainTopToolHeight)];
    }
    return _topToolView;
}
#pragma mark -- cycleScrollView
- (SDCycleScrollView *)cycleScrollView{
    if (!_cycleScrollView) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, kMainHeaderHeight) delegate:self placeholderImage:nil];
        _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        _cycleScrollView.pageControlDotSize = CGSizeMake(Get375Width(5), Get375Width(5));
        _cycleScrollView.currentPageDotColor = RGBA(255, 255, 255, 1);
        _cycleScrollView.pageDotColor = RGBA(255, 255, 255, 0.5);
    }
    return _cycleScrollView;
}
#pragma mark segmentScroll
- (MHsegmentScrollView *)segmentScrollView{
    if (!_segmentScrollView) {
        _segmentScrollView = [[MHsegmentScrollView alloc]initWithFrame:CGRectMake(0, kMainHeaderHeight, KscreenWidth, Get375Width(40))];
        _segmentScrollView.delegate = self;
    }
    return _segmentScrollView;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
