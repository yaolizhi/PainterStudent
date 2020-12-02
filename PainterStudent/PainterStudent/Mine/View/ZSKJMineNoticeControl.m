//
//  ZSKJMineNoticeControl.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/23.
//

#import "ZSKJMineNoticeControl.h"


@interface ZSKJMineNoticeControl ()


@property (nonatomic, strong) UIImageView *iconView; //!<图标
@property (nonatomic, strong) UILabel *noticeLabel; //!< 通知个数


@end

@implementation ZSKJMineNoticeControl



- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.iconView];
        [self addSubview:self.noticeLabel];
        
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.equalTo(self.mas_left);
            make.bottom.equalTo(self.mas_bottom);
            make.width.equalTo(@(30));
            make.height.equalTo(@(25));
        }];
        
        [self.noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.width.height.equalTo(@(15));
            make.centerY.equalTo(self.iconView.mas_top);
            make.left.equalTo(self.iconView.mas_right).offset(-10);
        }];
        
        
        
    }
    return self;
}





#pragma mark - Private Method
//设置通知数量
-(void)setNotice:(NSString*)notice
{
    [self.noticeLabel setText:notice];
}

#pragma mark - Getter / Setter
-(UIImageView *)iconView
{
    if (!_iconView)
    {
        _iconView  = [[UIImageView alloc]init];
        [_iconView setContentMode:UIViewContentModeScaleAspectFit];
        [_iconView setImageName:@"mineNotice"];
    }
    return _iconView;
}



-(UILabel *)noticeLabel
{
    if (!_noticeLabel)
    {
        _noticeLabel = [[UILabel alloc]init];
        [_noticeLabel setTextAlignment:NSTextAlignmentCenter];
        [_noticeLabel setFont:[UIFont systemFontOfSize:10]];
        [_noticeLabel setTextColor:KWhiteColor];
        [_noticeLabel setBackgroundColor:[UIColor redColor]];
        [_noticeLabel setCornerRadius:7.5];
        [_noticeLabel setText:@"12"];
    }
    return _noticeLabel;
}









@end


