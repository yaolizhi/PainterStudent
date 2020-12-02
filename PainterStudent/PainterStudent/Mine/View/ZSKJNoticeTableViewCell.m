//
//  ZSKJNoticeTableViewCell.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/26.
//

#import "ZSKJNoticeTableViewCell.h"

@interface ZSKJNoticeTableViewCell ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UIView *dotView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIView *lineView;




@end

@implementation ZSKJNoticeTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.dotView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.dateLabel];
        [self.contentView addSubview:self.lineView];
        
        
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.contentView.mas_left).offset(15);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.height.width.equalTo(@(50));
            
        }];
        
        
        [self.dotView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.iconView.mas_right);
            make.top.equalTo(self.iconView.mas_top);
            make.width.height.equalTo(@(10));
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.dotView.mas_right).offset(10);
            make.top.equalTo(self.iconView.mas_top);
        }];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.titleLabel);
            make.bottom.equalTo(self.iconView.mas_bottom);
        }];
        
        [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.right.equalTo(self.contentView.mas_right).offset(-15);
            make.top.equalTo(self.titleLabel);
            
        }];
        
        
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.right.bottom.equalTo(self.contentView);
            make.height.equalTo(@(10));
                    
        }];
    }
    return self;
}




-(void)setModel:(ZSKJNoticeModel *)model
{
    _model = model;
    
    [self.titleLabel setText:model.title];
    [self.contentLabel setText:model.content];
    [self.dateLabel setText:model.date];
    
    
    [self.dotView setHidden:(BOOL)model.type];
    

}





#pragma mark - Getter / Setter
-(UIImageView *)iconView
{
    if (!_iconView)
    {
        _iconView = [[UIImageView alloc]init];
        [_iconView setImageName:@"noticeIcon"];
    }
    return _iconView;
}


-(UIView *)dotView
{
    if (!_dotView)
    {
        _dotView = [[UIView alloc]init];
        [_dotView setBackgroundColor:KRedColor];
        [_dotView setCornerRadius:CornerRadius_5];
    }
    return _dotView;
}


-(UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [_titleLabel setTextColor:KTextColor];
    }
    return _titleLabel;
}


-(UILabel *)contentLabel
{
    if (!_contentLabel)
    {
        _contentLabel = [[UILabel alloc]init];
        [_contentLabel setFont:[UIFont boldSystemFontOfSize:12]];
        [_contentLabel setTextColor:KSubTextColor];
    }
    return _contentLabel;
}


-(UILabel *)dateLabel
{
    if (!_dateLabel)
    {
        _dateLabel = [[UILabel alloc]init];
        [_dateLabel setFont:[UIFont boldSystemFontOfSize:12]];
        [_dateLabel setTextColor:KSubTextColor];
    }
    return _dateLabel;
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
