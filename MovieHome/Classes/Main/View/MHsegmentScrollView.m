//
//  MHsegmentScrollView.m
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import "MHsegmentScrollView.h"


#define marign Get375Width(15)
#define padding Get375Width(20)

@interface MHsegmentScrollView()
@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) UIImageView *currentSelectedItemImageView;//线
@property (nonatomic, strong) UIButton *selectedBtn;
@property (nonatomic, strong) NSMutableArray *buttons;
@end
@implementation MHsegmentScrollView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
      
        [self initUI];
          
    }
    return self;
}
- (void)initUI{
    _buttons = [NSMutableArray array];
    [self addSubview:self.mainScrollView];
    self.mainScrollView.frame = self.bounds;
    
}
- (void)setTagArray:(NSArray *)tagArray{
    _tagArray = tagArray;
    if (self.subviews.count > 0) {
        for(UIView *view in self.mainScrollView.subviews) {
            [view removeFromSuperview];
        }
    }
  
   [self.mainScrollView addSubview:self.currentSelectedItemImageView];
    UIButton *markBtn;
    for (NSInteger i = 0; i<_tagArray.count; i++){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *title = _tagArray[i];
        btn.tag = i;
        CGFloat width = [title widthForFont:PingFangFont(14)];
        if (!markBtn) {
            btn.frame = CGRectMake(marign, 0, width, CGRectGetHeight(self.mainScrollView.frame)-Get375Width(1));
            _selectedBtn = btn;
            _selectedBtn.selected = YES;
            if (self.didClickBtnBlock) {
                self.didClickBtnBlock(title, 0, YES);
            }
            self.currentSelectedItemImageView.frame = CGRectMake(marign, self.mainScrollView.frame.size.height - Get375Width(1), btn.frame.size.width, Get375Width(1));
        }else{
            btn.frame = CGRectMake(CGRectGetMaxX(markBtn.frame)+padding, 0, width, CGRectGetHeight(self.mainScrollView.frame)-Get375Width(1));
        }
     
      
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:RGBA(151, 151, 151, 1) forState:UIControlStateNormal];
        [btn setTitleColor:RGBA(255, 203, 91, 1) forState:UIControlStateSelected];
        btn.titleLabel.font = PingFangFont(14);
        
        [btn addTarget:self action:@selector(changeSelectedItem:) forControlEvents:UIControlEventTouchUpInside];
        [self.mainScrollView addSubview:btn];
        [_buttons addObject:btn];
        markBtn = btn;
    }
     CGFloat total = CGRectGetMaxX(markBtn.frame)+marign;
    self.mainScrollView.contentSize = CGSizeMake(total, 0);
}
- (void)scrollDidIndex:(int)index{
    UIButton *btn = [_buttons safeObjectAtIndex:index];
    [self changeSelectedItem:btn];
}
- (void)changeSelectedItem:(UIButton *)btn{
    [UIView animateWithDuration:0.3 animations:^{
      self.currentSelectedItemImageView.frame = CGRectMake(CGRectGetMinX(btn.frame), self.mainScrollView.frame.size.height-Get375Width(1), btn.frame.size.width, Get375Width(1));
    } completion:nil];
    _selectedBtn.selected = NO;
    btn.selected = !btn.selected;
    
    _selectedBtn = btn;
    if (self.didClickBtnBlock) {
        self.didClickBtnBlock(btn.titleLabel.text, btn.tag, NO);
    }
}
- (UIScrollView *)mainScrollView{
    if (!_mainScrollView) {
        _mainScrollView = [UIScrollView new];
       
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.backgroundColor = RGBA(30, 30, 30, 1);
    }
    return _mainScrollView;
}
- (UIImageView *)currentSelectedItemImageView {
    if (!_currentSelectedItemImageView) {
        _currentSelectedItemImageView = [[UIImageView alloc] init];
        _currentSelectedItemImageView.backgroundColor = RGBA(255, 203, 91, 1);
    }
    return _currentSelectedItemImageView;
}
@end
