//
//  ZSKJNatureCollectionViewCell.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/12/3.
//

#import "ZSKJNatureCollectionViewCell.h"

@interface ZSKJNatureCollectionViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;





@end



@implementation ZSKJNatureCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self.contentView setBackgroundColor:UIColorFromRGB(0xFFECD9)];
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {

            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
                    
        }];
        [self.contentView setCornerRadius:20];
    }
    return self;
}


-(void)setTitle:(NSString*)title
{
    [self.titleLabel setText:title];
}




#pragma mark - Getter / Setter
-(UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont systemFontOfSize:18]];
        [_titleLabel setTextColor:KMainColor];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}



@end
