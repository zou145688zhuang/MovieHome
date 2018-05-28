//
//  MHDIYNormalHeader.m
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import "MHDIYNormalHeader.h"
@interface MHDIYNormalHeader()

@property (nonatomic,strong) CABasicAnimation *forwardAnimation;
@property (nonatomic,strong) CABasicAnimation *backforwardAnimation;

@end
@implementation MHDIYNormalHeader

- (void)dealloc {
    [_logoView.layer removeAnimationForKey:@"Rotation"];
}

- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 80;
    
    // 添加label
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor lightGrayColor];
    label.font = [UIFont boldSystemFontOfSize:11];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    _label = label;
    // logo
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mj_animated_0"]];
    logo.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:logo];
    _logoView = logo;
    // logo eye
    UIImageView *eyesImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mj_animated_1"]];
    eyesImageV.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:eyesImageV];
    _eyesImageV = eyesImageV;
    
    self.forwardAnimation     = [self clockAnimationWithFlag:0];
    self.backforwardAnimation = [self clockAnimationWithFlag:1];
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.label.frame = CGRectMake(.0f,self.mj_h -21.0f,self.mj_w,21.0f);
    
    self.logoView.bounds  = CGRectMake(.0f,.0f,40.0f,40.0f);
    self.logoView.center  = CGPointMake(self.mj_w / 2,40.0f);
    self.eyesImageV.frame = self.logoView.frame;
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
    //    NSLog(@"%@",change);
    //
    //    if (((NSNumber *)change[@"new"]).integerValue == 3) {
    //        [_logoView.layer removeAllAnimations];
    //       [_logoView.layer addAnimation:self.backforwardAnimation forKey:@"backforwardAnimation"];
    //    }
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    [_logoView.layer removeAllAnimations];
    
    MJRefreshCheckState;
    switch (state) {
        case MJRefreshStateIdle:
            self.label.text = @"下拉刷新";
            self.eyesImageV.image = [UIImage imageNamed:@"mj_animated_2"];
            break;
        case MJRefreshStatePulling:
            self.label.text = @"松开刷新";
            self.eyesImageV.image = [UIImage imageNamed:@"mj_animated_1"];
            [_logoView.layer addAnimation:self.backforwardAnimation forKey:@"backforwardAnimation"];
            break;
        case MJRefreshStateRefreshing:
            self.label.text = @"正在刷新";
            self.eyesImageV.image = [UIImage imageNamed:@"mj_animated_2"];
            [_logoView.layer addAnimation:self.forwardAnimation forKey:@"forwardAnimation"];
            break;
        case MJRefreshStateWillRefresh:
            self.eyesImageV.image = [UIImage imageNamed:@"mj_animated_2"];
            break;
        default:
            break;
    }
}

- (CABasicAnimation *)clockAnimationWithFlag:(NSInteger)flag {
    CABasicAnimation *animation = nil;
    animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue = [NSNumber numberWithFloat: (0 == flag) ? (-M_PI * 2.0) : (M_PI * 2.0) ];
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 2;
    animation.repeatCount = 1000;
    animation.cumulative = NO;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    return animation;
}

- (void)scaleAnimateWithValue:(CGFloat)percent {
    
    CGFloat val = (percent == .0f) ? 1.0f : percent;
    val = (val > 1.2f) ? 1.2f : val;
    
    self.logoView.transform = CGAffineTransformMakeScale(val,val);
}

- (void)rotationAnimate {
    
    NSLog(@"state:%@",@(self.state));
    
    [_logoView.layer removeAllAnimations];
    if (self.state == MJRefreshStatePulling
        ||self.state == MJRefreshStateWillRefresh) {
        [_logoView.layer addAnimation:self.forwardAnimation forKey:@"forwardAnimation"];
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    [self scaleAnimateWithValue:pullingPercent];
}


@end
