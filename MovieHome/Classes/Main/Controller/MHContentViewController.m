//
//  MHContentViewController.m
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import "MHContentViewController.h"
#import "MHContentFollCell.h"
#import "MHMovieDto.h"
#define MHMainFoldCellid @"MHMainFoldCellid"
@interface MHContentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *modelArray;
@end

@implementation MHContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    for (NSInteger i = 0; i < 20; i++) {
        MHMovieDto *dto = [[MHMovieDto alloc]init];
        [self.modelArray addObject:dto];
        
    }
    [self.tableView reloadData];
}
- (void)initUI{
    
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 100;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KscreenWidth, kMainHeaderHeight+kMainSegmentH)];
   [self.tableView registerClass:[MHContentFollCell class] forCellReuseIdentifier:MHMainFoldCellid];
    _contentScrollView = self.tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MHMovieDto *dto = [self.modelArray safeObjectAtIndex:indexPath.row];
     
    if (dto.isOpen) {
        return kMainCellBaseContentH+kMainCellToolH+kMainContainerH+Get375Width(15);
    }else{
        return kMainCellBaseContentH+kMainCellToolH+Get375Width(15);
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MHContentFollCell *cell = [tableView dequeueReusableCellWithIdentifier:MHMainFoldCellid];
    MHMovieDto *dto = [self.modelArray safeObjectAtIndex:indexPath.row];
    [cell setContentMovie:dto];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  MHMovieDto *dto = [self.modelArray safeObjectAtIndex:indexPath.row];
    if (dto.isOpen) {
        dto.isOpen = NO;
    }else{
        dto.isOpen = YES;
    }
    //[self.modelArray replaceObjectAtIndex:indexPath.row withObject:dto];
    [self.tableView reloadRowAtIndexPath:indexPath withRowAnimation:UITableViewRowAnimationFade];
}
- (NSMutableArray *)modelArray {
    if (!_modelArray) {
        
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
