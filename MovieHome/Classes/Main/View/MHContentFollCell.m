//
//  MHContentFollCell.m
//  MovieHome
//
//  Created by 邹壮 on 2018/6/5.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import "MHContentFollCell.h"
@implementation MHBaseStarView
- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setStarCount:(NSInteger)starCount {
    if (starCount == 0) {
        return;
    }
    if (_starCount != starCount) {
        _starCount = starCount;
        if (starCount > 5) {
            starCount = 5;
        }
        self.index = starCount;
        [self setNeedsDisplay];
        
    }
}
#pragma mark - DrawStarsMethod

- (void)drawRect:(CGRect)rect {
    UIImage *norImage = [UIImage imageNamed:@"Combined Shape"];
    UIImage *selImage = [UIImage imageNamed:@"Combined Shape2"];
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 画图
    for (NSInteger i = 0; i < 5; i ++) {
        UIImage *drawImage = i < self.index ? selImage : norImage;
        [self drawImage:context CGImageRef:drawImage.CGImage CGRect:CGRectMake((i == 0) ? Get375Width(14) : i * Get375Width(5)+Get375Width(14) + Get375Width(11) * i, 0, Get375Width(11), Get375Width(11))];
    }
}

- (void)drawImage:(CGContextRef)context
       CGImageRef:(CGImageRef)image
           CGRect:(CGRect)rect {
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, rect.origin.x, rect.origin.y);
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, -rect.origin.x, -rect.origin.y);
    CGContextDrawImage(context, rect, image);
    CGContextRestoreGState(context);
}
@end
@implementation MHContentFoldBaseView
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
@implementation MHContentFoldDrawerView
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
@implementation MHContentFoldToolView
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
@implementation MHContentFollCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       [self initUI];
    }
    return self;
}
- (void)setContentMovie:(MHMovieDto *)dto{
    
    if (dto.isOpen) {
        self.drawerView.frame = CGRectMake(Get375Width(15), CGRectGetMaxY(self.baseView.frame), CGRectGetWidth(self.baseView.frame), kMainContainerH);
        self.toolView.frame = CGRectMake(Get375Width(15), CGRectGetMaxY(self.drawerView.frame), CGRectGetWidth(self.baseView.frame), kMainCellToolH);
        
    }else{
        self.drawerView.frame = CGRectMake(Get375Width(15), CGRectGetMaxY(self.baseView.frame), CGRectGetWidth(self.baseView.frame), 0);
        self.toolView.frame = CGRectMake(Get375Width(15), CGRectGetMaxY(self.drawerView.frame), CGRectGetWidth(self.baseView.frame), kMainCellToolH);
    }
    UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:_toolView.bounds byRoundingCorners:UIRectCornerBottomRight | UIRectCornerBottomLeft cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    maskLayer1.frame = _toolView.bounds;
    maskLayer1.path = maskPath1.CGPath;
    _toolView.layer.mask = maskLayer1;
}






- (void)initUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self addSubview:self.baseView];
    [self addSubview:self.drawerView];
    [self addSubview:self.toolView];
    self.baseView.frame = CGRectMake(Get375Width(15), Get375Width(15), kScreenWidth-2*Get375Width(15), kMainCellBaseContentH);
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_baseView.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerTopLeft cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = _baseView.bounds;
    maskLayer.path = maskPath.CGPath;
    _baseView.layer.mask = maskLayer;
    //
    
}

- (MHContentFoldBaseView *)baseView{
    if (!_baseView) {
        _baseView = [MHContentFoldBaseView new];
        _baseView.backgroundColor = [UIColor redColor];
        
    }
    return _baseView;
}
- (MHContentFoldDrawerView *)drawerView{
    if (!_drawerView) {
        _drawerView = [MHContentFoldDrawerView new];
          _drawerView.backgroundColor = [UIColor grayColor];
    }
    return _drawerView;
}
- (MHContentFoldToolView *)toolView{
    if (!_toolView) {
        _toolView = [MHContentFoldToolView new];
        _toolView.backgroundColor = [UIColor greenColor];
    }
    return _toolView;
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
