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
#define CATEGORY  @[@"推荐",@"原创",@"热门",@"美食",@"生活",@"设计感",@"家居",@"礼物",@"阅读",@"运动健身",@"旅行户外"]
@interface MHMainViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) MHsegmentScrollView *segmentScrollView;
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
    
    [self.view addSubview:self.segmentScrollView];
    self.segmentScrollView.tagArray = CATEGORY;
    [self.bottomScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
}
#pragma observe 监听collection滚动

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
}
#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.bottomScrollView) {
        int index =  scrollView.contentOffset.x/scrollView.frame.size.width;
         self.currentUIScrollView  = self.scrollViews[index];
        [self.segmentScrollView scrollDidIndex:index];
    }
}
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
                make.height.mas_equalTo(KscreenHeight);
                make.width.mas_equalTo(KscreenWidth);
            }];
            [_contentVC.contentScrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        }
         self.currentUIScrollView = self.scrollViews[0];
        _bottomScrollView.contentSize = CGSizeMake(KscreenWidth*CATEGORY.count, 0);
       
    }
    return _bottomScrollView;
}
#pragma mark segmentScroll
- (MHsegmentScrollView *)segmentScrollView{
    if (!_segmentScrollView) {
        _segmentScrollView = [[MHsegmentScrollView alloc]initWithFrame:CGRectMake(0, kMainHeaderHeight, KscreenWidth, Get375Width(40))];
    }
    return _segmentScrollView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
