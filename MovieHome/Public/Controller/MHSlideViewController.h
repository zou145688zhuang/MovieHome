//
//  MHSlideViewController.h
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kLeftPageWidth 118

#define kMainPageDistance   (kScreenWidth- kLeftPageWidth)   //打开左侧窗时，中视图(右视图)露出的宽度
#define kMainPageScale   1  //打开左侧窗时，中视图(右视图）缩放比例
#define kMainPageCenter  CGPointMake(kScreenWidth + kScreenWidth * kMainPageScale / 2.0 - kMainPageDistance, kScreenHeight / 2)  //打开左侧窗时，中视图中心点
#define vCouldChangeDeckStateDistance  kLeftPageWidth / 2.0 - 40 //滑动距离大于此数时，状态改变（关--》开，或者开--》关）

#define vSpeedFloat   0.7    //滑动速度
#define kLeftAlpha 0.9  //左侧蒙版的最大值
#define kLeftCenterX 30 //左侧初始偏移量
#define kLeftScale 0.7 //左侧初始缩放比例

#define vDeckCanNotPanViewTag    987654   // 不响应此侧滑的View的tag

@interface MHSlideViewController : UIViewController
//滑动速度系数-建议在0.5-1之间。默认为0.7
@property (nonatomic, assign) CGFloat speedf;

//左侧窗控制器
@property (nonatomic, strong) UIViewController *leftVC;

@property (nonatomic,strong) UIViewController *mainVC;
//点击手势控制器，是否允许点击视图恢复视图位置。默认为yes
@property (nonatomic, strong) UITapGestureRecognizer *sideslipTapGes;

//滑动手势控制器
@property (nonatomic, strong) UIPanGestureRecognizer *pan;

//侧滑窗是否关闭(关闭时显示为主页)
@property (nonatomic, assign) BOOL closed;



/**
 @brief 初始化侧滑控制器
 @param leftVC 右视图控制器
 mainVC 中间视图控制器
 @result instancetype 初始化生成的对象
 */
- (instancetype)initWithLeftView:(UIViewController *)leftVC
                     andMainView:(UIViewController *)mainVC;

/**
 @brief 关闭左视图
 */
- (void)closeLeftView;


/**
 @brief 打开左视图
 */
- (void)openLeftView;

/**
 *  设置滑动开关是否开启
 *
 *  @param enabled YES:支持滑动手势，NO:不支持滑动手势
 */
- (void)setPanEnabled: (BOOL) enabled;
@end
