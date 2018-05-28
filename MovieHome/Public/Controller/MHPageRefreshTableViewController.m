//
//  MHPageRefreshTableViewController.m
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import "MHPageRefreshTableViewController.h"
#define Distance_To_Loading 90
@interface MHPageRefreshTableViewController ()
@property (nonatomic, strong) MHDIYNormalHeader *headerView;
@property (nonatomic, strong) MHDIYNormalFooter *footerView;

@end

@implementation MHPageRefreshTableViewController

-(id)init
{
    self = [super init];
    
    if (self) {
        self.refreshSupportType = DJHRefreshSupportNone;
        self.currentPage = 1;
        self.pageSize  = 10;
        _isLastPage  = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}



- (BOOL)isSupportRefreshPull {
    return ((_refreshSupportType==DJHRefreshSupportAll || _refreshSupportType==DJHRefreshSupportPull));
}

- (BOOL)isSupportPushLoadMore {
    return ((_refreshSupportType==DJHRefreshSupportAll || _refreshSupportType==DJHRefreshSupportPush));
}

- (void)setRefreshSupportType:(DJHRefreshSupportType)refreshSupportType{
    _refreshSupportType = refreshSupportType;
    
    if([self isSupportRefreshPull]) {
        self.tableView.mj_header = self.headerView;
    }
    if([self isSupportPushLoadMore]) {
        self.tableView.mj_footer = self.footerView;
    }
}

- (MHDIYNormalHeader *)headerView{
    if (!_headerView) {
        __weak typeof(self)weakSelf = self;
        _headerView = [MHDIYNormalHeader headerWithRefreshingBlock:^{
            [weakSelf refreshData];
        }];
        _headerView.backgroundColor = UIColorFromRGB(0xf2f2f2);
    }
    return _headerView;
}

- (MHDIYNormalFooter *)footerView{
    if (!_footerView) {
        __weak typeof(self)weakSelf = self;
        _footerView = [MHDIYNormalFooter footerWithRefreshingBlock:^{
            [weakSelf loadMoreData];
        }];
    }
    return _footerView;
}

- (void)startRefreshLoading{
    [self.tableView.mj_header beginRefreshing];
}

- (void)startMoreAnimation:(BOOL)animating{
    [self.tableView.mj_footer beginRefreshing];
}

- (void)reloadTableViewDataSource{
    _isFromHead = YES;
    [self refreshData];
}

- (BOOL)hasMore{
    return !_isLastPage;
}


// 上面是老版本的加载属性,下面是改版的方法.
- (void)setIsLastPage:(BOOL)isLastPage{
    _isLastPage = isLastPage;
    if (isLastPage) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        [self.tableView.mj_footer setState:MJRefreshStateNoMoreData];
    } else {
        [self.tableView.mj_footer resetNoMoreData];
    }
}

/*子类实现*/
- (void)refreshData{
    self.isFromHead = YES;
    self.isLoading = YES;
}

/*子类实现*/
- (void)refreshDataComplete{
    self.isLoading = NO;
    [self.tableView.mj_header endRefreshing];
}

/*子类实现*/
- (void)loadMoreData{
    self.isFromHead = NO;
    self.isLoading = YES;
}

/*子类实现*/
- (void)loadMoreDataComplete{
    self.isLoading = NO;
    [self.tableView.mj_footer endRefreshing];
}

/*立刻结束刷新*/
- (void)endHeaderOrFooterRefreshing {
    self.isLoading = NO;
    if ([self.tableView.mj_header isRefreshing]) {
        [self.tableView.mj_header endRefreshing];
    }
    
    if ([self.tableView.mj_footer isRefreshing]){
        [self.tableView.mj_footer endRefreshing];
    }
}

// 自定义上拉加载更多的定制化服务
-(void)loadMoreTitle:(NSString*)title forState:(MJRefreshState)state {
    
    [self.footerView setTitle:title forState:state];
}

-(BOOL)isMoreLoading {
    return [self.tableView.mj_footer isRefreshing];
}
- (void)doneLoadingTableViewData{
    //  model should call this when its done loading
    [self dataSourceDidFinishLoadingNewData];
}

-(void)dataSourceDidFinishLoadingNewData{
    
}

#pragma mark - View lifecycle
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
