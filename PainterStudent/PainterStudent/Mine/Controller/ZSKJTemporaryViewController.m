//
//  ZSKJTemporaryViewController.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/24.
//

#import "ZSKJTemporaryViewController.h"
#import "TPPasswordTextView.h"


@interface ZSKJTemporaryViewController ()


@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) TPPasswordTextView *passwordTextView;





@end

@implementation ZSKJTemporaryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:KWhiteColor];
    [self setTitle:@"临时课堂"];
}

- (void)addSubVies:(BOOL)views
{
    if (views)
    {
        [self.view addSubview:self.iconView];
        [self.view addSubview:self.tipLabel];
        [self.view addSubview:self.passwordTextView];
        
        
        [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.bottom.equalTo(self.passwordTextView.mas_top).offset(-30);
            make.centerX.equalTo(self.view);
            
        }];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
                
            make.bottom.equalTo(self.tipLabel.mas_top).offset(-20);
            make.centerX.equalTo(self.view);
        }];
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        [self.passwordTextView setCenter:CGPointMake(self.view.centerX, 400)];
        [self.passwordTextView setPasswordDidChangeBlock:^(NSString *password) {

            
        }];
        
        
        
    }
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self.passwordTextView hideKeyboard];
}



#pragma mark - Getter / Setter
-(TPPasswordTextView *)passwordTextView
{
    if (!_passwordTextView)
    {
        _passwordTextView = [[TPPasswordTextView alloc]initWithFrame:CGRectMake(0, 0, 600, 100)];
        [_passwordTextView setElementBorderColor:KGrayLineColor];
        [_passwordTextView setElementCount:6];
    }
    return _passwordTextView;
}




-(UIImageView *)iconView
{
    if (!_iconView)
    {
        _iconView = [[UIImageView alloc]init];
        [_iconView setImageName:@"mineTemporary"];
    }
    return _iconView;
}


-(UILabel *)tipLabel
{
    if (!_tipLabel)
    {
        _tipLabel = [[UILabel alloc]init];
        [_tipLabel setTextColor:KTextColor];
        [_tipLabel setFont:[UIFont systemFontOfSize:16]];
        [_tipLabel setText:@"请输入秘钥"];
    }
    return _tipLabel;
}


@end
