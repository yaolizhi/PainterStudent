//
//  ZSKJEvaluationTableViewCell.m
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/5.
//

#import "ZSKJEvaluationTableViewCell.h"


@interface ZSKJEvaluationTableViewCell ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *dataLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UILabel *typeLabel;

@property (nonatomic, strong) UIImageView *preview;
@property (nonatomic, strong) UIImageView *typeView;
@property (nonatomic, strong) UILabel *lecture;


@end

@implementation ZSKJEvaluationTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self.contentView setBackgroundColor:KLineColor];
        [self.contentView addSubview:self.bgView];

        
        [self.bgView addSubview:self.dataLabel];
        [self.bgView addSubview:self.titleLabel];
        [self.bgView addSubview:self.subtitleLabel];
        [self.bgView addSubview:self.preview];
        [self.bgView addSubview:self.typeView];
        [self.typeView addSubview:self.typeLabel];
        [self.bgView addSubview:self.lecture];
        
        
        
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(15, 15, 0, 15));
                    
        }];
        
        
        
        
        [self.dataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.bgView.mas_top);
            make.left.equalTo(self.bgView.mas_left).offset(15);
            make.height.equalTo(@(44));
                    
        }];
        
        
        [self.typeView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.bgView.mas_top);
            make.right.equalTo(self.bgView.mas_right).offset(-15);
            
        }];
        
        
        [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.typeView.mas_top).offset(10);
            make.centerX.equalTo(self.typeView.mas_centerX);
            
        }];
        
        [self.preview mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.dataLabel.mas_bottom).offset(20);
            make.left.equalTo(self.dataLabel.mas_left);
            make.height.width.equalTo(@(80));
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            
            make.top.equalTo(self.preview.mas_top).offset(30);
            make.left.equalTo(self.preview.mas_right).offset(10);
        }];
        
        [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
            make.left.equalTo(self.titleLabel);
                    
        }];
        
        [self.lecture mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.bottom.right.equalTo(self.bgView);
            make.height.equalTo(@(44));
                    
        }];
    }
    return self;
}



#pragma mark - 设置数据模型
-(void)setModel:(ZSKJEvaluationModel *)model
{
    _model = model;
    [self.preview sd_setImageWithURL:[NSURL URLWithString:model.img]];
    [self.dataLabel setText:[NSString stringWithFormat:@"%@ %@",model.date,model.time]];
    [self.titleLabel setText:model.title];
    [self.subtitleLabel setText:model.title];
    [self.typeLabel setText:model.type_text];
    
    switch (model.type)
    {
        case 1:
        {
            [self.typeView setImageName:@"typeitems"];
        }
            break;
        case 2:
        {
            [self.typeView setImageName:@"auditionl"];
            
        }
            break;
    }
    
    
    switch (model.status)
    {
        case 1:
        {
            [self.lecture setText:model.status_text];
        }
            break;
        case 2:
        {
            [self.lecture setText:@"查看学习报告"];
        }
            break;
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



-(UILabel *)dataLabel
{
    if (!_dataLabel)
    {
        _dataLabel = [[UILabel alloc]init];
        [_dataLabel setFont:[UIFont boldSystemFontOfSize:18]];
        [_dataLabel setTextColor:KTextColor];
    }
    return _dataLabel;
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


-(UILabel *)subtitleLabel
{
    if (!_subtitleLabel)
    {
        _subtitleLabel = [[UILabel alloc]init];
        [_subtitleLabel setFont:[UIFont boldSystemFontOfSize:12]];
        [_subtitleLabel setTextColor:KSubTextColor];
    }
    return _subtitleLabel;
}







-(UILabel *)typeLabel
{
    if (!_typeLabel)
    {
        _typeLabel = [[UILabel alloc]init];
        [_typeLabel setFont:[UIFont boldSystemFontOfSize:12]];
        [_typeLabel setTextColor:KWhiteColor];
    }
    return _typeLabel;
}


-(UIImageView *)typeView
{
    if (!_typeView)
    {
        _typeView = [[UIImageView alloc]init];
    }
    return _typeView;
}


-(UIImageView *)preview
{
    if (!_preview)
    {
        _preview = [[UIImageView alloc]init];
        [_preview setBackgroundColor:KLineColor];
    }
    return _preview;
}



-(UILabel *)lecture
{
    if (!_lecture)
    {
        _lecture = [[UILabel alloc]init];
        [_lecture setTextColor:KWhiteColor];
        [_lecture setBackgroundColor:KMainColor];
        [_lecture setTextAlignment:NSTextAlignmentCenter];
    }
    return _lecture;
}







@end
