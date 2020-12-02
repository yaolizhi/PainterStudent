//
//  UIImageView+Category.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/25.
//

#import "UIImageView+Category.h"

@implementation UIImageView (Category)

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setContentMode:UIViewContentModeScaleAspectFit];
    }
    return self;
}





/// 设置图片名称
/// @param name 图片名称
-(void)setImageName:(NSString*)name
{
    UIImage *image = [UIImage imageNamed:name];
    if (image)
    {
        [self setImage:image];
    }
}

-(void)setAnimationImagesArray:(NSArray*)images
{
    [self setAnimationImages:images];
    [self setContentMode:UIViewContentModeScaleAspectFit];
    //切换动作的时间0.3秒，来控制图像显示的速度有多快
    [self setAnimationDuration:1.0];
    //动画的重复次数，想让它无限循环就赋成0
    [self setAnimationRepeatCount:0];
}











@end
