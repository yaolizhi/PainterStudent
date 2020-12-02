//
//  ZSKJMineServiceViewController.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/23.
//

#import "ZSKJMineServiceViewController.h"

@interface ZSKJMineServiceViewController ()


@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *titleLabel; //!< 标签
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *subtitleLabel; //!< 标签




@end

@implementation ZSKJMineServiceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"客服"];
}




- (void)addSubVies:(BOOL)views
{
    if (views)
    {
        [self.view addSubview:self.bgView];
        [self.bgView addSubview:self.iconImageView];
        [self.bgView addSubview:self.titleLabel];
        [self.bgView addSubview:self.subtitleLabel];
        
        
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.view.mas_top).offset(80);
            make.left.mas_equalTo(self.view.mas_left).offset(15);
            make.right.equalTo(self.view.mas_right).offset(-15);
            make.height.equalTo(@(100));
        }];
        
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.equalTo(self.bgView.mas_left).offset(30);
            make.centerY.equalTo(self.bgView);
            make.width.height.equalTo(@(50));
        }];
        
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.iconImageView.mas_right).offset(15);
            make.bottom.equalTo(self.bgView.mas_centerY).offset(-5);
        }];
        
        [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.bgView.mas_centerY);
            make.left.equalTo(self.titleLabel.mas_left);
            
        }];
    }
}


#pragma mark - Getter / Setter
-(UIView *)bgView
{
    if (!_bgView)
    {
        _bgView = [[UIView alloc]init];
        [_bgView setBackgroundColor:KWhiteColor];
        [_bgView setCornerRadius:CornerRadius_5];
    }
    return _bgView;
}


-(UIImageView *)iconImageView
{
    if (!_iconImageView)
    {
        _iconImageView  = [[UIImageView alloc]init];
        [_iconImageView setImageName:@"hotline"];
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
        [_titleLabel setText:@"客服电话"];
    }
    return _titleLabel;
}


-(UILabel *)subtitleLabel
{
    if (!_subtitleLabel)
    {
        _subtitleLabel = [[UILabel alloc]init];
        [_subtitleLabel setFont:[UIFont boldSystemFontOfSize:20]];
        [_subtitleLabel setTextColor:KTextColor];
        [_subtitleLabel setText:@"0371-98765432"];
    }
    return _subtitleLabel;
}






@end
