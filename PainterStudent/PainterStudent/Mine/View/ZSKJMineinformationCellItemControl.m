//
//  ZSKJMineinformationCellItemControl.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/23.
//

#import "ZSKJMineinformationCellItemControl.h"

@interface ZSKJMineinformationCellItemControl ()

@property (nonatomic, strong) UILabel *titleLabel; //!< 标签
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *subtitleLabel; //!< 标签
@property (nonatomic, strong) UIImageView *accessoryView;
@property (nonatomic, strong) UIView *lineView;




@end

@implementation ZSKJMineinformationCellItemControl


- (instancetype)initType:(NSInteger)type
{
    self = [super init];
    if (self)
    {
        [self setBackgroundColor:KWhiteColor];
        [self addSubview:self.iconImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.subtitleLabel];
        [self addSubview:self.accessoryView];
        [self addSubview:self.lineView];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.mas_left).offset(15);
            make.centerY.equalTo(self.mas_centerY);
                    
        }];
        
        
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.equalTo(self.mas_left).offset(15);
            make.right.equalTo(self.mas_right).offset(15);
            make.height.equalTo(@(1));
        }];
        
        switch (type)
        {
            case 1:
            {
                [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make)
                {
                   
                    make.right.equalTo(self.mas_right).offset(-15);
                    make.centerY.equalTo(self.mas_centerY);
                            
                }];
                
            }
                break;
            case 2:
            {
                [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {

                    make.right.equalTo(self.accessoryView.mas_left).offset(-10);
                    make.width.height.equalTo(@(30));
                    make.centerY.mas_equalTo(self.mas_centerY);
                }];
                
                [self.accessoryView mas_makeConstraints:^(MASConstraintMaker *make) {
                   
                    make.right.equalTo(self.mas_right).offset(-10);
                    make.centerY.equalTo(self.mas_centerY);
                    make.width.equalTo(@(30));
                            
                }];
            }
                break;
            case 3:
            {
                [self.accessoryView mas_makeConstraints:^(MASConstraintMaker *make) {
                   
                    make.right.equalTo(self.mas_right).offset(-10);
                    make.centerY.equalTo(self.mas_centerY);
                    make.width.equalTo(@(30));
                            
                }];
            }
                break;
        }
        
    }
    return self;
}





-(void)setIcon:(NSString*)icon title:(NSString*)title accessory:(NSString*)accessory
{
    [self.iconImageView setImageName:icon];
    [self.titleLabel setText:title];
    [self.accessoryView setImageName:accessory];
   
}



-(void)setTitle:(NSString*)title subtitle:(NSString*)subtitle
{
    [self.titleLabel setText:title];
    [self.subtitleLabel setText:subtitle];
}


-(void)setTitle:(NSString*)title
{
    [self.titleLabel setText:title];
}


-(void)setIcon:(NSString*)icon
{
    [self.iconImageView setImageName:icon];
}

-(void)accessory:(NSString*)accessory
{
    [self.accessoryView setImageName:accessory];
}







#pragma mark - Getter / Setter
-(UIImageView *)iconImageView
{
    if (!_iconImageView)
    {
        _iconImageView  = [[UIImageView alloc]init];
        [_iconImageView setBackgroundColor:[UIColor orangeColor]];
    }
    return _iconImageView;
}


-(UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_titleLabel setTextColor:KTextColor];
    }
    return _titleLabel;
}


-(UILabel *)subtitleLabel
{
    if (!_subtitleLabel)
    {
        _subtitleLabel = [[UILabel alloc]init];
        [_subtitleLabel setFont:[UIFont systemFontOfSize:14]];
        [_subtitleLabel setTextColor:KSubTextColor];
    }
    return _subtitleLabel;
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
