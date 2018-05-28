//
//  MHNavigationViewController.m
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import "MHNavigationViewController.h"
#import "UIViewController+BackButtonHandler.h"
@interface MHNavigationViewController ()

@end

@implementation MHNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#333333"]};
    self.navigationBar.titleTextAttributes = dic;
    self.navigationBar.translucent = NO;
    self.navigationBar.hidden = NO;
    self.navigationBar.barStyle = UIBarStyleDefault;
    // Do any additional setup after loading the view.
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"black_back"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"black_back"] forState:UIControlStateHighlighted];
        button.frame = CGRectMake(10, 0, 60,44);
        // 让按钮内部的所有内容左对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //        [button sizeToFit];
        // 让按钮的内容往左边偏移10
        //        button.dk_backgroundColorPicker = DKColorPickerWithRGB(0xffffff, 0x343434, 0xfafafa);
        [button addTarget:self action:@selector(onBack:) forControlEvents:UIControlEventTouchUpInside];
        // 修改导航栏左边的item
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        
    }
    
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
}
- (void)onBack:(UIButton *)back{
    BOOL shouldPop = YES;
    UIViewController* vc = [self topViewController];
    //若是需要获取返回按钮的事件  return YES
    if([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
        //隐藏系统的
        [vc.navigationController.navigationItem setHidesBackButton:YES];
        [vc.navigationItem setHidesBackButton:YES];
        [vc.navigationController.navigationBar.backItem setHidesBackButton:YES];
       
        shouldPop = [vc navigationShouldPopOnBackButton];
    }
    if (shouldPop ) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    }else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
