//
//  ZSKJDefaultAlertView.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/23.
//

#import "ZSKJDefaultAlertView.h"

@interface ZSKJDefaultAlertView ()


@property (nonatomic, strong) UIView *boardView; //!< 承载面板
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *cancelBtn; //!< 取消按钮
@property (nonatomic, strong) UIButton *submitBtn; //!< 提交按钮
@property (nonatomic, copy) void (^submitBlock)(BOOL action);
@property (nonatomic, copy) void (^actionBlock)(BOOL action);






@end

@implementation ZSKJDefaultAlertView


+(void)showWithTitle:(NSString*)title witIcon:(NSString*)icon submitBlock:(void(^)(BOOL action))submitBlcok
{
    ZSKJDefaultAlertView *alert = [[ZSKJDefaultAlertView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) withType:1];
    [alert.titleLabel setText:title];
    [alert.iconView setImageName:icon];
    [alert addTarget:alert action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [alert setSubmitBlock:submitBlcok];
    [alert show];
}



+(void)showWithTitle:(NSString*)title witIcon:(NSString*)icon actionBlock:(void(^)(BOOL action))actionBlock
{
    ZSKJDefaultAlertView *alert = [[ZSKJDefaultAlertView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) withType:2];
    [alert.titleLabel setText:title];
    [alert.iconView setImageName:icon];
    [alert addTarget:alert action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [alert setSubmitBlock:actionBlock];
    [alert show];
}




-(instancetype)initWithFrame:(CGRect)frame withType:(NSInteger)type
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.3]];
        
        [self addSubview:self.boardView];
        [self.boardView addSubview:self.iconView];
        [self.boardView addSubview:self.titleLabel];
        [self.boardView addSubview:self.submitBtn];
        [self.boardView addSubview:self.cancelBtn];
        
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.boardView.mas_top).offset(50);
            make.width.height.equalTo(@(50));
            make.centerX.equalTo(self.boardView);
            
        }];
        
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.iconView.mas_bottom).offset(30);
            make.centerX.equalTo(self.boardView);
        }];
        
        switch (type)
        {
            case 1:
            {
                [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                   
                    make.left.bottom.right.equalTo(self.boardView);
                    make.height.equalTo(@(44));
                    
                }];
            }
                break;
            case 2:
            {
                [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                   
                    make.left.bottom.equalTo(self.boardView);
                    make.height.equalTo(@(44));
                    make.right.equalTo(self.boardView.mas_centerX);
                    
                }];
                
                [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                   
                    make.left.equalTo(self.cancelBtn.mas_right);
                    make.bottom.right.equalTo(self.boardView);
                    make.height.equalTo(self.cancelBtn);
                }];
            }
                break;
        }
        
        
        
        
        
        
        
        
        
        
        
        
    }
    return self;
}











#pragma mark - Private Method
-(void)show
{
    [AppWindow addSubview:self];
}

// 隐藏
-(void)hide
{
    [self removeFromSuperview];
}


-(void)submitBtnAction:(UIButton*)sender
{
    if (self.submitBlock)
    {
        self.submitBlock(YES);
    }
    
    [self hide];
}




-(void)cancelBtnAction:(UIButton*)sender
{
    if (self.submitBlock)
    {
        self.submitBlock(NO);
    }
    
    [self hide];
}





#pragma mark - Getter / Setter
-(UIView *)boardView
{
    if (nil == _boardView)
    {
        _boardView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 435, 225)];
        [_boardView setBackgroundColor:KWhiteColor];
        [_boardView setCenter:CGPointMake(self.centerX, self.centerY)];
        [_boardView byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10)];
    }
    return _boardView;
}


- (UIImageView *)iconView
{
    if (!_iconView)
    {
        _iconView = [[UIImageView alloc]init];
    }
    return _iconView;
}









-(UILabel *)titleLabel
{
    if (nil == _titleLabel)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_titleLabel setTextColor:KTextColor];
    }
    return _titleLabel;
}


-(UIButton *)cancelBtn
{
    if (!_cancelBtn)
    {
        _cancelBtn = [[UIButton alloc]init];
        [_cancelBtn setBackgroundColor:KLineColor];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:KTextColor forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(cancelBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

-(UIButton *)submitBtn
{
    if (!_submitBtn)
    {
        _submitBtn = [[UIButton alloc]init];
        [_submitBtn setBackgroundColor:KMainColor];
        [_submitBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_submitBtn setTitleColor:KWhiteColor forState:UIControlStateNormal];
        [_submitBtn addTarget:self action:@selector(submitBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitBtn;
}

@end
