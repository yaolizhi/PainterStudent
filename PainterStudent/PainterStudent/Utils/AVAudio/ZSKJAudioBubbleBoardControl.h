//
//  ZSKJAudioBubbleBoardControl.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/12/2.
//

#import <UIKit/UIKit.h>
#import "ZSKJAudioTool.h"


NS_ASSUME_NONNULL_BEGIN

@interface ZSKJAudioBubbleBoardControl : UIControl


/// 开始播放
/// @param name 播放的名字
-(void)startPlayWithName:(NSString*)name;


/// 录音时长
/// @param time CGFloat 的时间
-(void)recordTime:(CGFloat)time;





@end

NS_ASSUME_NONNULL_END
