//
//  MHPageRefreshTableViewController.h
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import "MHBaseViewController.h"
#import "MHDIYNormalHeader.h"
#import "MHDIYNormalFooter.h"
typedef enum {
    DJHRefreshSupportAll,    // 同时支持 下拉刷新、上拉加载更多
    DJHRefreshSupportPull,   // 下拉刷新
    DJHRefreshSupportPush,   // 上拉加载更多
    DJHRefreshSupportNone    // 都不支持
}DJHRefreshSupportType;

typedef enum {
    DJHTriggerRefresh,
    DJHTriggerLoadMore
}DJHTriggerActionType;

@interface MHPageRefreshTableViewController : MHBaseViewController
/*
 实现上下拉必须给以下两个属性重新赋值
 */
@property (nonatomic, assign) DJHRefreshSupportType refreshSupportType;

// 默认赋值YES
// 注意:此值在refreshDataComplete / loadMoreDataComplete 之后这只该属性
@property (nonatomic, assign) BOOL            isLastPage;
/*
 * 子类中 务必实现的代理函数
 * - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
 * - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
 * @xzoscar
 */

@property (nonatomic, assign) NSInteger        currentPage; // 当前页面

@property (nonatomic, assign) NSInteger     pageSize;   // 每页多少内容

@property (nonatomic, assign) NSInteger        totalPage;  // 总页面数

@property (nonatomic, assign) NSInteger        totalCount; // 总条数

@property (nonatomic, assign) BOOL            reloading;

@property (nonatomic, assign) BOOL          isLoading;

@property (nonatomic, assign) BOOL          isFromHead;

@property (nonatomic, assign) BOOL          isBackingToTop; //判断是否处在加载完成，恢复contentInset的状态

@property (nonatomic, assign) BOOL          isMoreLoading; // 是否上拉加载更多


- (void)startRefreshLoading;

- (void)dataSourceDidFinishLoadingNewData;

- (void)reloadTableViewDataSource;

- (BOOL)hasMore;

//下拉刷新
- (void)refreshData;

/**
 下拉刷新完成
 */
- (void)refreshDataComplete;

//上拉加载
- (void)loadMoreData;

// 加载更多动画
- (void)startMoreAnimation:(BOOL)animating;

// 加载更多完成
- (void)loadMoreDataComplete;

// 立刻结束下拉刷新或上拉加载
- (void)endHeaderOrFooterRefreshing;

// 自定义上拉加载更多的定制化服务
// 满足自定义风格的需求.一般不需要使用它.
// 在setRefreshSupportType 函数调用之后使用.
-(void)loadMoreTitle:(NSString*)title forState:(MJRefreshState)state;
@end
