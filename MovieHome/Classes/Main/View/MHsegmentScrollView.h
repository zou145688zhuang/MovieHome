//
//  MHsegmentScrollView.h
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MHsegmentScrollViewDelegate<NSObject>
- (void)didClickBtnTitlt:(NSString *)title index:(NSInteger)ondex first:(BOOL)first;
@end
@interface MHsegmentScrollView : UIView
@property (nonatomic, strong) NSArray *tagArray;
@property (nonatomic, weak) id<MHsegmentScrollViewDelegate>delegate;
- (void)scrollDidIndex:(NSInteger)index;
@end
