//
//  UIImageView+Category.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Category)

/// 设置图片名称
/// @param name 图片名称
-(void)setImageName:(NSString*)name;


/// 添加动画图片数组
/// @param images 动画图片数组
-(void)setAnimationImagesArray:(NSArray*)images;





@end

NS_ASSUME_NONNULL_END
