//
//  ZSKJMineHeaderItemOptoonControl.m
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/7.
//

#import "ZSKJMineHeaderItemOptoonControl.h"


@interface ZSKJMineHeaderItemOptoonControl ()

@property (nonatomic, strong) UILabel *numLabel;   //!< 数量
@property (nonatomic, strong) UILabel *titleLabel; //!< 标题



@end

@implementation ZSKJMineHeaderItemOptoonControl



- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.numLabel];
        [self addSubview:self.titleLabel];
        
        [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {

            
            make.bottom.equalTo(self.mas_centerY).offset(10);
            make.centerX.mas_equalTo(self.mas_centerX);
                 
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    
            
            make.top.equalTo(self.mas_centerY).offset(15);
            make.centerX.equalTo(self.mas_centerX);
        }];
    }
    return self;
}


#pragma mark - Public Method
-(void)setTitle:(NSString*)title
{
    [self.titleLabel setText:title];
}


-(void)setNum:(NSString*)num
{
    [self.numLabel setText:[NSString stringWithFormat:@"%@",num]];
}





#pragma mark - Getter / Setter
-(UILabel *)numLabel
{
    if (!_numLabel)
    {
        _numLabel = [[UILabel alloc]init];
        [_numLabel setFont:[UIFont boldSystemFontOfSize:40]];
        [_numLabel setTextColor:KMainColor];
    }
    return _numLabel;
}


-(UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
        [_titleLabel setTextColor:KTextColor];
    }
    return _titleLabel;
}









@end
