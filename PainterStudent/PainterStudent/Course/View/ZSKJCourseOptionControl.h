//
//  ZSKJCourseOptionControl.h
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZSKJCourseOptionControlDeletage <NSObject>

-(void)optionItemAction:(NSInteger)index;

@end


@interface ZSKJCourseOptionControl : UIControl

- (instancetype)initWithFrame:(CGRect)frame withDeletage:(id<ZSKJCourseOptionControlDeletage>)deletage;

-(void)setOneTitle:(NSString*)oneTitle withTwoTitle:(NSString*)twoTitle;


/// 选中第几个
/// @param index 默认选择第一个下标为0
-(void)setIndexTag:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
