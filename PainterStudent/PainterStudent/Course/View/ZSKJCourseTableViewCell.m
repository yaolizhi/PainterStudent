//
//  ZSKJCourseTableViewCell.m
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/2.
//

#import "ZSKJCourseTableViewCell.h"

@interface ZSKJCourseTableViewCell ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *dataLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UILabel *typeLabel;

@property (nonatomic, strong) UIImageView *preview;
@property (nonatomic, strong) UIImageView *typeView;
@property (nonatomic, strong) UIButton *lectureBtn;


@end

@implementation ZSKJCourseTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self.contentView addSubview:self.bgView];
        [self.bgView setBackgroundColor:KWhiteColor];
        
        [self.bgView addSubview:self.dataLabel];
        [self.bgView addSubview:self.titleLabel];
        [self.bgView addSubview:self.subtitleLabel];
        [self.bgView addSubview:self.preview];
        [self.bgView addSubview:self.typeView];
        [self.typeView addSubview:self.typeLabel];
        [self.bgView addSubview:self.lectureBtn];
        
        
        
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
        
        [self.lectureBtn mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.bottom.right.equalTo(self.bgView);
            make.height.equalTo(@(44));
                    
        }];
    }
    return self;
}



#pragma mark - 设置数据模型
-(void)setModel:(ZSKJCourseModel *)model
{
    _model = model;
    
    
    
    
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
        [_dataLabel setText:@"2020-11-16  10:00-11:00"];
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
        [_titleLabel setText:@"狗狗和小鸟"];
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
        [_subtitleLabel setText:@"线条与色彩-0基础，初学者"];
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
        [_typeLabel setText:@"正式课"];
    }
    return _typeLabel;
}


-(UIImageView *)typeView
{
    if (!_typeView)
    {
        _typeView = [[UIImageView alloc]init];
        [_typeView setImageName:@"typeitems"];
    }
    return _typeView;
}


-(UIImageView *)preview
{
    if (!_preview)
    {
        _preview = [[UIImageView alloc]init];
        [_preview setBackgroundColor:[UIColor purpleColor]];
    }
    return _preview;
}



-(UIButton *)lectureBtn
{
    if (!_lectureBtn)
    {
        _lectureBtn = [[UIButton alloc]init];
        [_lectureBtn setTitle:@"开始讲课" forState:UIControlStateNormal];
        [_lectureBtn setTitleColor:KWhiteColor forState:UIControlStateNormal];
        [_lectureBtn setBackgroundColor:KMainColor];
        [_lectureBtn setTag:2];
    }
    return _lectureBtn;
}







@end
