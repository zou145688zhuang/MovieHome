//
//  MHMainTopToolView.m
//  MovieHome
//
//  Created by 邹壮 on 2018/5/30.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import "MHMainTopToolView.h"
#import "AppDelegate.h"
@interface MHMainTopToolView()<UISearchBarDelegate>
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIImageView *avatarImageView;
//搜索框
@property (nonatomic, strong) UISearchBar *searchBar;

//取消按钮
@property (nonatomic, strong) UIButton *cancelButton;
//记录上一个偏移量
@property (nonatomic, assign) CGFloat lastScrollOffsetY;
@end
@implementation MHMainTopToolView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)scrollOffsetY:(CGFloat)offsetY{
   
    if ( offsetY>0 && offsetY<= DISTANCE) {
      
        CGFloat alpha = (DISTANCE - offsetY)/(DISTANCE);
        _searchBar.alpha = alpha;
        _cancelButton.alpha = alpha;
        
        if (offsetY <=DISTANCE/2) {
            self.backgroundColor = [UIColor clearColor];
            CGFloat imgCenterLeft = offsetY*(KscreenWidth/2 - Get375Width(15))/(DISTANCE/2)+Get375Width(15);
            [self.avatarImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.contentView).offset(imgCenterLeft);
                make.centerY.mas_equalTo(self.contentView);
                make.size.mas_equalTo(CGSizeMake(30, 30));
            }];
        }
    }else if( offsetY < 0){
        [self.avatarImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).offset(Get375Width(15));
            make.centerY.mas_equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        _searchBar.alpha = 1;
        _cancelButton.alpha = 1;
        self.backgroundColor = [UIColor clearColor];
    }else if (offsetY > DISTANCE){
        [self.avatarImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).offset(KscreenWidth/2-15);
            make.centerY.mas_equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        _searchBar.alpha = 0;
        _cancelButton.alpha = 0;
        self.backgroundColor = [UIColor whiteColor];
    }
}
- (void)initUI{
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.searchBar];
    [self.contentView addSubview:self.cancelButton];
    [self makeLayout];
}
- (void)makeLayout{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(20);
        make.left.right.bottom.mas_equalTo(self);
    }];
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).with.offset(Get375Width(15));
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).with.offset(-Get375Width(15));
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatarImageView.mas_right).offset(Get375Width(10));
        make.top.mas_equalTo(self.contentView).offset(7);
        make.height.mas_equalTo(30);
        make.right.mas_equalTo(self.cancelButton.mas_left).offset(-Get375Width(10));
    }];
}
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KscreenWidth, 44)];
    }
    return _contentView;
}
- (UIImageView *)avatarImageView{
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"avatar_icon_placeholder"]];
        _avatarImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toggleLeftVC)];
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.layer.cornerRadius = 30/2;
        [_avatarImageView addGestureRecognizer:tap];
    }
    return _avatarImageView;
}
- (void)toggleLeftVC{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate toggleLeftVC];
}
- (UISearchBar *)searchBar {
    
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] init];
        
        //_searchBar.delegate = (id<UISearchBarDelegate>)self;
        _searchBar.placeholder =@"搜索你想要的";
        _searchBar.backgroundImage = [UIImage imageWithColor:UIColorFromRGB(0xffffff)];
        _searchBar.layer.cornerRadius = Get375Width(4/2.0);
        _searchBar.layer.masksToBounds = YES;
        [_searchBar setSearchTextPositionAdjustment:UIOffsetMake(4, 0)];
        _searchBar.delegate = self;
        UITextField *txfSearchField = [_searchBar valueForKey:@"_searchField"];
        txfSearchField.borderStyle = UITextBorderStyleNone;
        txfSearchField.clearButtonMode = UITextFieldViewModeAlways;
        txfSearchField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        txfSearchField.font = PingFangFont(13.0);
        txfSearchField.textColor = UIColorFromRGB(0x444444);
        [txfSearchField setValue:[UIColor colorWithHexString:@"bbbbbb"] forKeyPath:@"_placeholderLabel.textColor"];
       // UIImage *leftImg = [UIImage imageNamed:@"superMarketSearch"];
        //[_searchBar setImage:leftImg forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        [_searchBar setPositionAdjustment:UIOffsetMake(Get375Width(-6), 0) forSearchBarIcon:UISearchBarIconSearch];
    }
    return _searchBar;
}

#pragma mark - 取消按钮
- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] init];
        _cancelButton.titleLabel.font = PingFangFont(14.0);
        _cancelButton.titleLabel.textAlignment = NSTextAlignmentLeft;
        [_cancelButton setTitleColor:UIColorFromRGB(0xfffffff) forState:UIControlStateNormal];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelSearch:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

#pragma mark - 搜索框左侧按钮点击
- (void)cancelSearch:(UIButton *)cancelButton {
    [self.searchBar resignFirstResponder];
}

@end
