//
//  ZSKJMineinformationCellItemControl.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZSKJMineinformationCellItemControl : UIControl

- (instancetype)initType:(NSInteger)type;

-(void)setIcon:(NSString*)icon title:(NSString*)title accessory:(NSString*)accessory;



-(void)setTitle:(NSString*)title subtitle:(NSString*)subtitle;

-(void)setTitle:(NSString*)title;
-(void)setIcon:(NSString*)icon;
-(void)accessory:(NSString*)accessory;



@end

NS_ASSUME_NONNULL_END
