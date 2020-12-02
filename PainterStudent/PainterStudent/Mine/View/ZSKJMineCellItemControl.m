//
//  ZSKJMineCellItemControl.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/23.
//

#import "ZSKJMineCellItemControl.h"

@interface ZSKJMineCellItemControl ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *accessoryView;
@property (nonatomic, strong) UIView *lineView;



@end

@implementation ZSKJMineCellItemControl

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setBackgroundColor:KWhiteColor];
        [self addSubview:self.iconImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.accessoryView];
        [self addSubview:self.lineView];
        
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.equalTo(self.mas_left).offset(15);
            make.width.height.equalTo(@(30));
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.iconImageView.mas_right).offset(15);
            make.centerY.equalTo(self.mas_centerY);
                    
        }];
        
        [self.accessoryView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.right.equalTo(self.mas_right).offset(-10);
            make.centerY.equalTo(self.mas_centerY);
            make.width.equalTo(@(30));
                    
        }];
        
        
        
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.equalTo(self.iconImageView.mas_left);
            make.right.equalTo(self.accessoryView.mas_right);
            make.height.equalTo(@(1));
        }];
        
        [self setCornerRadius:CornerRadius_5];
    }
    return self;
}




-(void)setIcon:(NSString*)icon title:(NSString*)title accessory:(NSString*)accessory
{
    [self.iconImageView setImageName:icon];
    [self.titleLabel setText:title];
    [self.accessoryView setImageName:accessory];
}






#pragma mark - Getter / Setter
-(UIImageView *)iconImageView
{
    if (!_iconImageView)
    {
        _iconImageView  = [[UIImageView alloc]init];
    }
    return _iconImageView;
}


-(UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont systemFontOfSize:14]];
    }
    return _titleLabel;
}


-(UIImageView *)accessoryView
{
    if (!_accessoryView)
    {
        _accessoryView  = [[UIImageView alloc]init];
        [_accessoryView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _accessoryView;
}


-(UIView *)lineView
{
    if (!_lineView)
    {
        _lineView = [[UIView alloc]init];
        [_lineView setBackgroundColor:KLineColor];
    }
    return _lineView;
}




@end
