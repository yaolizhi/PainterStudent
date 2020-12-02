//
//  ZSKJAudioStatusBoardControl.h
//  ZZJRecord-Demo
//
//  Created by 姚立志 on 2020/12/2.
//  Copyright © 2020 chefuzzj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZSKJAudioTool.h"




NS_ASSUME_NONNULL_BEGIN

@interface ZSKJAudioStatusBoardControl : UIControl


-(void)showWithTitle:(NSString*)title witIcon:(NSString*)icon withImages:(NSArray<UIImage *>*)images isAnimation:(BOOL)animation;

-(void)show;

// 隐藏
-(void)hide;

@end

NS_ASSUME_NONNULL_END
