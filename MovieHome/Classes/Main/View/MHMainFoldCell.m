//
//  MHMainFoldCell.m
//  MovieHome
//
//  Created by 邹壮 on 2018/6/1.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import "MHMainFoldCell.h"


@implementation MHMainBaseContentView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    
}
@end


@implementation MHContainerView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    
}
@end
@implementation MHMainToolView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    NSArray *views = @[self.downloadBtn,self.collectionBtn,self.shareBtn,self.line0,self.line1];
    for (UIView *view in views) {
        [self addSubview:view];
    }
}
- (UIButton *)downloadBtn{
    if (!_downloadBtn) {
        _downloadBtn = [self createBtn:@"下载"];
    }
    return _downloadBtn;
}
- (UIButton *)collectionBtn{
    if (!_collectionBtn) {
        _collectionBtn = [self createBtn:@"收藏"];
    }
    return _collectionBtn;
}
- (UIButton *)shareBtn{
    if (!_shareBtn) {
        _shareBtn = [self createBtn:@"分享"];
    }
    return _shareBtn;
}
- (UIImageView *)line0{
    if (!_line0) {
        _line0 = [self createLineView];
    }
    return _line0;
}
- (UIImageView *)line1{
    if (!_line1) {
        _line1 = [self createLineView];
    }
    return _line1;
}
- (UIImageView *)createLineView{
    UIImageView *line = [UIImageView new];
    line.backgroundColor = RGBA(237, 237, 237, 0.5);
    
    return line;
}
- (UIButton *)createBtn:(NSString *)title{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = PingFangFont(14);
    [btn setTitle:title forState:UIControlStateNormal];
    return btn;
}
@end
@interface MHMainFoldCell()
@property (nonatomic, strong) UIView *kcontentView;
@end

@implementation MHMainFoldCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      [self initUI];
    }
    return self;
}

- (void)initUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self addSubview:self.kcontentView];
    [self.kcontentView addSubview:self.baseContentView];
    [self.kcontentView addSubview:self.containerView];
    [self.kcontentView addSubview:self.toolView];
//    [self.kcontentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self).offset(Get375Width(15));
//        make.left.mas_equalTo(self).offset(Get375Width(15));
//        make.right.mas_equalTo(self).offset(-Get375Width(15));
//        make.bottom.mas_equalTo(self);
//    }];
//    [self.baseContentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.mas_equalTo(self.kcontentView);
//        make.height.mas_equalTo(kMainCellBaseContentH);
//    }];
//    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(self.kcontentView);
//        make.bottom.mas_equalTo(self.baseContentView.mas_bottom);
//        make.height.mas_equalTo(kMainContainerH);
//    }];
//    [self.toolView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(self.kcontentView);
//        make.top.mas_equalTo(self.baseContentView.mas_bottom);
//        make.height.mas_equalTo(kMainCellToolH);
//    }];
}
- (void)setContentMovie:(MHMovieDto *)dto{
    _dto = dto;
    [self toggleOpneAnimation];
    [self layoutIfNeeded];
}

- (void)toggleOpneAnimation{
    [self.kcontentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(Get375Width(15));
        make.left.mas_equalTo(self).offset(Get375Width(15));
        make.right.mas_equalTo(self).offset(-Get375Width(15));
        make.bottom.mas_equalTo(self);
    }];
    [self.baseContentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.kcontentView);
        make.height.mas_equalTo(kMainCellBaseContentH);
    }];
    
    if (_dto.isOpen) {
        
        
     
            self.containerView.hidden = NO;
           
            [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
               
                make.left.right.mas_equalTo(self.kcontentView);
                make.top.mas_equalTo(self.kcontentView).offset(kMainCellBaseContentH);
                make.height.mas_equalTo(kMainContainerH);
            }];
            [self.toolView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(self.kcontentView);
                make.top.mas_equalTo(self.containerView.mas_bottom);
                make.height.mas_equalTo(kMainCellToolH);
            }];
        
        
        
       
    }else{
        self.containerView.hidden = YES;
        [UIView animateWithDuration:0.3 animations:^{
            [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(self.kcontentView);
                make.bottom.mas_equalTo(self.baseContentView.mas_bottom);
                make.height.mas_equalTo(kMainContainerH);
            }];
            [self.toolView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(self.kcontentView);
                make.top.mas_equalTo(self.baseContentView.mas_bottom);
                make.height.mas_equalTo(kMainCellToolH);
            }];
        } completion:^(BOOL finished) {
            
        }];
    }
}
- (UIView *)kcontentView{
    if (!_kcontentView) {
        _kcontentView  = [UIView new];
        _kcontentView.backgroundColor = [UIColor clearColor];
    }
    return _kcontentView;
}
- (MHMainBaseContentView *)baseContentView{
    if (!_baseContentView) {
        
        _baseContentView = [MHMainBaseContentView new];
        _baseContentView.backgroundColor = [UIColor orangeColor];
        
    }
    return _baseContentView;
}
- (MHContainerView *)containerView{
    if (!_containerView) {
        _containerView = [MHContainerView new];
        _containerView.hidden = YES;
        _containerView.backgroundColor = [UIColor redColor];
    }
    return _containerView;
}
- (MHMainToolView *)toolView{
    if (!_toolView) {
        _toolView = [MHMainToolView new];
       _toolView.backgroundColor = [UIColor grayColor];
    }
    return _toolView;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_baseContentView.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerTopLeft cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    _baseContentView.layer.mask = maskLayer;
    
    UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:_toolView.bounds byRoundingCorners:UIRectCornerBottomRight | UIRectCornerBottomLeft cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    maskLayer1.frame = self.bounds;
    maskLayer1.path = maskPath1.CGPath;
    _toolView.layer.mask = maskLayer1;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
