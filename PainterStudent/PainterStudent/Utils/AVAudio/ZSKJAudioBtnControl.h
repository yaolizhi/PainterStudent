//
//  ZSKJAudioBtnControl.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/12/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@protocol ZSKJAudioBtnControlDeletage <NSObject>

@optional

/// 手指按下
/// @param sender 当前对象
-(void)recordTouchDownAction:(UIControl*)sender;

/// 手指滑出按钮 取消录音 按下按钮，并且在按钮外部（outside）松手
/// @param sender 当前对象
-(void)recordTouchUpOutsideAction:(UIControl*)sender;

/// 手指抬起 按下按钮，并且在按钮内部（inside）松手
/// @param sender 当前对象
-(void)recordTouchUpInsideAction:(UIControl*)sender;

/// 手指从外部划入按钮内部范围（持续性），但未松开
/// @param sender 当前对象
-(void)recordTouchDragEnterAction:(UIControl*)sender;

/// 手指从外部划入按钮内部的动作（一次性）
/// @param sender 当前对象
-(void)recordTouchDragInsideAction:(UIControl*)sender;

/// 手指从内部划出按钮范围（持续性），但未松开
/// @param sender 当前对象
-(void)recordTouchDragOutsideAction:(UIControl*)sender;

/// 手指从内部划出按钮内部的动作（一次性）
/// @param sender 当前对象
-(void)recordTouchDragExitAction:(UIControl*)sender;


@end


@interface ZSKJAudioBtnControl : UIControl


- (instancetype)initWithFrame:(CGRect)frame wihtDeletage:(id<ZSKJAudioBtnControlDeletage>)deletage;
- (instancetype)initWithDeletage:(id<ZSKJAudioBtnControlDeletage>)deletage;


- (void)setButtonStateWithRecording;
- (void)setButtonStateWithNormal;




@end

NS_ASSUME_NONNULL_END
