//
//  ZSKJExhibitionCollectionViewCell.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/30.
//

#import "ZSKJExhibitionCollectionViewCell.h"

@interface ZSKJExhibitionCollectionViewCell ()

@property (nonatomic, strong) UIImageView *preview;

@end



@implementation ZSKJExhibitionCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self.contentView addSubview:self.preview];
        [self.preview setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    }
    return self;
}


- (void)setModel:(ZSKJExhibitionModel *)model
{
    _model = model;
    [self.preview setImageName:model.url];
}

#pragma mark - Getter / Setter
-(UIImageView *)preview
{
    if (!_preview)
    {
        _preview = [[UIImageView alloc]init];
        [_preview setImageName:@"banner"];
        [_preview setContentMode:UIViewContentModeScaleAspectFill];
    }
    return _preview;
}






@end
