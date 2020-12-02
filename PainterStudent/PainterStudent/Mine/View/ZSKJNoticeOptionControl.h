//
//  ZSKJNoticeOptionControl.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol ZSKJNoticeOptionControlDeletage <NSObject>

-(void)optionItemAction:(NSInteger)index;

@end


@interface ZSKJNoticeOptionControl : UIControl

- (instancetype)initWithFrame:(CGRect)frame withDeletage:(id<ZSKJNoticeOptionControlDeletage>)deletage;

-(void)setOneTitle:(NSString*)oneTitle withTwoTitle:(NSString*)twoTitle;


-(void)setIndexTag:(NSInteger)index;



@end

NS_ASSUME_NONNULL_END
