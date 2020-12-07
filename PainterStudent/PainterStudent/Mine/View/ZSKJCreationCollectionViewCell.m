//
//  ZSKJCreationCollectionViewCell.m
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/2.
//

#import "ZSKJCreationCollectionViewCell.h"

@interface ZSKJCreationCollectionViewCell ()

@property (nonatomic, strong) UIImageView *preView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *dateLabel;

@end

@implementation ZSKJCreationCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self.contentView setBackgroundColor:KWhiteColor];
        
        [self.contentView addSubview:self.preView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.dateLabel];
        
        
        [self.preView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.top.right.equalTo(self.contentView);
            make.height.equalTo(@(175));
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.preView.mas_bottom).offset(20);
            make.left.equalTo(self.contentView.mas_left).offset(15);
        }];
        
        
        [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
            make.left.equalTo(self.titleLabel);

        }];
    }
    return self;
}

- (void)setModel:(ZSKJCreationModel *)model
{
    _model = model;
    
    
    [self.preView sd_setImageWithURL:[NSURL URLWithString:model.user_report]];
    [self.titleLabel setText:model.title];
    [self.dateLabel setText:model.report_time];
    
    
}





#pragma mark - Getter / Setter
-(UIImageView *)preView
{
    if (!_preView)
    {
        _preView = [[UIImageView alloc]init];
        [_preView setBackgroundColor:KLineColor];
    }
    return _preView;
}


-(UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont systemFontOfSize:17]];
        [_titleLabel setTextColor:KTextColor];
    }
    return _titleLabel;
}


-(UILabel *)dateLabel
{
    if (!_dateLabel)
    {
        _dateLabel = [[UILabel alloc]init];
        [_dateLabel setFont:[UIFont systemFontOfSize:16]];
        [_dateLabel setTextColor:KSubTextColor];
    }
    return _dateLabel;
}













@end
