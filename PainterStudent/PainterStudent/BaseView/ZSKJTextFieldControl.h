//
//  ZSKJTextFieldControl.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZSKJTextFieldControl : UIControl


/// 创建密码输入框
/// @param type 1  左侧文本右边输入框  2  左侧图标 右侧输入框
- (instancetype)initType:(NSInteger)type;



/// 设置输入是否是加密形式
/// @param secure BOOL 
-(void)setSecureTextEntry:(BOOL)secure;
-(void)setPlaceholder:(NSString*)placeholder;
-(void)setFont:(UIFont*)font;
-(void)setTitle:(NSString*)title;




@end

NS_ASSUME_NONNULL_END
