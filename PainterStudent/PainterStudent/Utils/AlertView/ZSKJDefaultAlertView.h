//
//  ZSKJDefaultAlertView.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZSKJDefaultAlertView : UIControl


//@"tipSucceed"
+(void)showWithTitle:(NSString*)title witIcon:(NSString*)icon submitBlock:(void(^)(BOOL action))submitBlcok;

//@"tipSucceed"
+(void)showWithTitle:(NSString*)title witIcon:(NSString*)icon actionBlock:(void(^)(BOOL action))actionBlock;


-(void)hide;


-(void)show;





@end

NS_ASSUME_NONNULL_END
