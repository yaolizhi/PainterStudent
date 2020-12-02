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


@end

NS_ASSUME_NONNULL_END
