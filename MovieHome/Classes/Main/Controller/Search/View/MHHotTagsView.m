//
//  MHHotTagsView.m
//  MovieHome
//
//  Created by 邹壮 on 2018/5/31.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import "MHHotTagsView.h"
@implementation MHHotTagsConfig
- (instancetype)init{
    self = [super init];
    if (self) {
        _marginX = Get375Width(14);
        _spaceY = Get375Width(10);
        _spaceX = Get375Width(10);
        _btnHeight = Get375Width(30);
        _selectedBGColor = @"#FF3300";
        _selectedTextColor = @"#FFFFFF";
    }
    return self;
}
@end


@interface MHHotTagsView ()
@property (nonatomic, strong) UIButton *selectedBtn;
@end
@implementation MHHotTagsView
- (instancetype)init{
    self = [super init];
    if (self) {
      _config = [[MHHotTagsConfig alloc]init];
    }
    return self;
}
- (void)setTagArray:(NSArray *)tagArray{
    _tagArray = tagArray;
    if (IsArrEmpty(tagArray)) {
        return;
    }
    if (self.subviews.count > 0) {
        for(UIView *view in self.subviews) {
            [view removeFromSuperview];
        }
    }
     UIButton * markBtn;
    for (NSInteger i = 0; i<_tagArray.count; i++) {
        UIButton * tagBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        tagBtn.tag = i+100;
        NSDictionary *dict = [_tagArray safeObjectAtIndex:i];
        NSString *color = EncodeStringFromDic(dict, @"color");
        NSString *title = EncodeStringFromDic(dict, @"title");
        //左右两边留10
        CGFloat width =  [self calculateString:title Width:Get375Width(13)] +Get375Width(20);
        if (!markBtn) {
            tagBtn.frame = CGRectMake(_config.marginX, 0, width, _config.btnHeight);
            _selectedBtn = tagBtn;
            
        }else{
            //判断按钮是否超出视图范围
            if (CGRectGetMaxX(markBtn.frame) + _config.spaceX + width + _config.marginX > CGRectGetWidth(self.frame)) {
                tagBtn.frame = CGRectMake(_config.marginX, CGRectGetMaxY(markBtn.frame) + _config.spaceY, width, _config.btnHeight);
            }else{
                tagBtn.frame = CGRectMake(CGRectGetMaxX(markBtn.frame) + _config.spaceX, markBtn.frame.origin.y, width, _config.btnHeight);
            }
        }
        [tagBtn setTitle:title forState:UIControlStateNormal];
        tagBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [tagBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        tagBtn.backgroundColor = [UIColor colorWithHexString:color];
        
        
        [_selectedBtn setTitleColor:[UIColor colorWithHexString:_config.selectedTextColor] forState:UIControlStateNormal];
        _selectedBtn.backgroundColor = [UIColor colorWithHexString:_config.selectedBGColor];
        [self makeCornerRadius:Get375Width(_config.btnHeight/2) borderColor:[UIColor clearColor] layer:tagBtn.layer borderWidth:0];
        markBtn = tagBtn;
        
        [tagBtn addTarget:self action:@selector(clickTo:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:markBtn];
        
    }
    CGRect rect = self.frame;
    rect.size.height = markBtn.frame.origin.y + markBtn.frame.size.height;
    self.frame = rect;
}
-(void)clickTo:(UIButton *)sender
{
    NSDictionary *dict = _tagArray[_selectedBtn.tag - 100];
    
    NSString *color = EncodeStringFromDic(dict, @"color");
    if (_selectedBtn.tag == sender.tag) {
        return;
    }
    [_selectedBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    _selectedBtn.backgroundColor = [UIColor colorWithHexString:color];
    
    [sender setTitleColor:[UIColor colorWithHexString:_config.selectedTextColor] forState:UIControlStateNormal];
    sender.backgroundColor = [UIColor colorWithHexString:_config.selectedBGColor];
    _selectedBtn = sender;
    NSDictionary *selectedDict = _tagArray[sender.tag - 100];
    if (self.didClickCategoryBlock) {
        _didClickCategoryBlock(EncodeStringFromDic(selectedDict, @"tagStr"),sender.tag -100,NO);
    }
}
-(void)makeCornerRadius:(CGFloat)radius borderColor:(UIColor *)borderColor layer:(CALayer *)layer borderWidth:(CGFloat)borderWidth
{
    layer.cornerRadius = radius;
    layer.masksToBounds = YES;
    layer.borderColor = borderColor.CGColor;
    layer.borderWidth = borderWidth;
}
-(CGFloat)calculateString:(NSString *)str Width:(NSInteger)font
{
    CGSize size = [str boundingRectWithSize:CGSizeMake( CGRectGetWidth(self.frame), FLT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]} context:nil].size;
    return size.width;
}
@end
