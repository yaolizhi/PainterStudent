//
//  ZSKJOptionScrollView.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/12/4.
//

#import "SSKJ_ScrollView.h"



@protocol ZSKJOptionScrollViewDeletage <NSObject>


-(void)optionScrollPage:(NSInteger)page;


@end

NS_ASSUME_NONNULL_BEGIN

@interface ZSKJOptionScrollView : SSKJ_ScrollView 






- (instancetype)initWithFrame:(CGRect)frame witDeletage:(id)delegate;




/// 设置滚动到某个位置
/// @param page 滚动到第几页
-(void)setContentOffPage:(NSInteger)page;




@end

NS_ASSUME_NONNULL_END
