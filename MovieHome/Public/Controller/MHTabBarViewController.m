//
//  MHTabBarViewController.m
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import "MHTabBarViewController.h"
#import "MHNavigationViewController.h"
@interface MHTabBarViewController ()

@end

@implementation MHTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)addChildViewController:(UIViewController *)controller withNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectImageName withTittle:(NSString *)tittle index:(NSInteger)index{
    
    MHNavigationViewController *nav = [[MHNavigationViewController alloc] initWithRootViewController:controller];
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    normalImage = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectImage = [UIImage imageNamed:selectImageName];
    selectImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [nav.tabBarItem setImage:normalImage];
    [nav.tabBarItem setSelectedImage:selectImage];
    nav.tabBarItem.title = tittle;
    [nav.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:8]} forState:UIControlStateNormal];
    
    UIColor *colorSelect=[UIColor blackColor];
    
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:colorSelect,NSFontAttributeName:[UIFont systemFontOfSize:8]} forState:UIControlStateSelected];
    
    [self addChildViewController:nav];
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
