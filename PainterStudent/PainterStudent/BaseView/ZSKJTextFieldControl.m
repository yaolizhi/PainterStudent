//
//  ZSKJTextFieldControl.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/20.
//

#import "ZSKJTextFieldControl.h"


@interface ZSKJTextFieldControl ()

@property (nonatomic, strong) UILabel *titleLabel; //!< 标题
@property (nonatomic, strong) UITextField *inputTextField; //!< 输入内容
@property (nonatomic, strong) UIImageView *imageView; //!< 图标

@property (nonatomic, strong) UIView *lineView; //!< 分割线


@end


@implementation ZSKJTextFieldControl

/// 创建密码输入框
/// @param type 1  左侧文本右边输入框  2  左侧图标 右侧输入框
- (instancetype)initType:(NSInteger)type
{
    self = [super init];
    if (self)
    {
        [self setBackgroundColor:KWhiteColor];

        [self addSubview:self.titleLabel];
        [self addSubview:self.imageView];
        [self addSubview:self.inputTextField];
        [self addSubview:self.lineView];

        
        
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(@(ScaleW(0.5)));
                    
        }];
        
        
        switch (type)
        {
            case 1:
            {
                [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make)
                {
                    make.left.equalTo(self.mas_left).offset(15);
                    make.centerY.mas_equalTo(self.mas_centerY);
                    make.width.equalTo(@(100));
                }];
                
                [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
                   
                    make.left.equalTo(self.titleLabel.mas_right);
                    make.right.equalTo(self.mas_right);
                    make.height.equalTo(self.mas_height);
                }];
            }
                break;
            case 2:
            {
                [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.mas_left);
                    make.centerY.mas_equalTo(self.mas_centerY);
                    make.width.height.equalTo(@(40));
                }];
                
                [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
                   
                    make.left.equalTo(self.imageView.mas_right);
                    make.right.equalTo(self.mas_right);
                    make.height.equalTo(self.mas_height);
                }];
            }
                break;
        }
        
    }
    return self;
}



#pragma mark - Public Method

/// 设置输入是否是加密形式
/// @param secure BOOL
-(void)setSecureTextEntry:(BOOL)secure
{
    [self.inputTextField setSecureTextEntry:secure];
}


-(void)setPlaceholder:(NSString*)placeholder
{
    [self.inputTextField setPlaceholder:placeholder];
}

-(void)setFont:(UIFont*)font
{
    [self.inputTextField setFont:font];
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
        [_titleLabel setTextColor:KTextColor];
        [_titleLabel setFont:[UIFont systemFontOfSize:14]];
    }
    return _titleLabel;
}



-(UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc]init];
        [_imageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _imageView;
}


-(UITextField *)inputTextField
{
    if (!_inputTextField)
    {
        _inputTextField = [[UITextField alloc]init];
        [_inputTextField setSecureTextEntry:YES];
        [_inputTextField setPlaceholder:@""];
        [_inputTextField setFont:[UIFont systemFontOfSize:12]];
        [_inputTextField setTintColor:KMainColor];
    }
    return _inputTextField;
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
