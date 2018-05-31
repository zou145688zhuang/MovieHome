//
//  MHBaseViewController.m
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import "MHBaseViewController.h"

@interface MHBaseViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(250, 250, 250, 1);
    // Do any additional setup after loading the view.
}



- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate   = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.sectionHeaderHeight = CGFLOAT_MIN;
        _tableView.sectionFooterHeight = CGFLOAT_MIN;  //ios11开始，必须设置此值 tableView初始化时设置区域头和底部间距为最小值
        CGSize sz = [UIScreen mainScreen].bounds.size;
        _tableView.frame = CGRectMake(.0f,.0f,sz.width,sz.height);
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}


#pragma mark -- 设置leftBarButtonItem
- (void)setLeftImageButton:(NSString *)imageName title:(NSString *)title method:(NSString *)method{
    UIButton *leftButton = [[UIButton alloc]init];
    leftButton.tag = 200;
    [leftButton addTarget:self action:NSSelectorFromString(method) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    [leftButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if (title) {
        NSDictionary *dictAttr = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor colorWithHexString:@"191919"]};
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:title
                                                                   attributes:dictAttr];
        [leftButton setAttributedTitle:attr forState:UIControlStateNormal];
    }
    [leftButton sizeToFit];
    leftButton.frame = CGRectMake(0, 0, CGRectGetWidth(leftButton.frame), CGRectGetHeight(leftButton.frame));
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
}
#pragma mark -- 设置 rightBarButtonItems
- (void)setRightButtons:(NSArray *)buttons{
    NSMutableArray *barButtonItems = [NSMutableArray array];
    for (NSInteger i = 0; i < buttons.count; i++) {
        NSDictionary *dict = [buttons objectAtIndex:i];
        NSString *imageName = [dict objectForKey:@"imageName"];
        NSString *title = [dict objectForKey:@"title"];
        NSString *method = [dict objectForKey:@"method"];
        NSString *tag = [dict objectForKey:@"tag"];
        NSInteger tagValue = [tag integerValue];
        UIButton*rightButton = [[UIButton alloc]init];
        rightButton.tag = tagValue;
        [rightButton addTarget:self action:NSSelectorFromString(method) forControlEvents:UIControlEventTouchUpInside];
        [rightButton setTitle:title forState:UIControlStateNormal];
        [rightButton setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [rightButton sizeToFit];
        rightButton.frame = CGRectMake(10, 0, 44, 44);
        rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -25);
        [rightButton.imageView sizeToFit];
        
        UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
        [barButtonItems addObject:buttonItem];
    }
    self.navigationItem.rightBarButtonItems = barButtonItems;
    
}
#pragma onBack 返回

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
