//
//  ZSKJLoginViewController.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/20.
//

#import "ZSKJLoginViewController.h"

@interface ZSKJLoginViewController ()

@property (nonatomic, strong) UIImageView *logoImageView; //!< logo
@property (nonatomic, strong) UIView *backView; //!< 承载视图
@property (nonatomic, strong) UIButton *forgetBtn; //!< 忘记密码
@property (nonatomic, strong) UIButton *loginBtn; //!< 登录
@property (nonatomic, strong) ZSKJTextFieldControl *accountFieldControl;
@property (nonatomic, strong) ZSKJTextFieldControl *pwdFieldControl;







@end

@implementation ZSKJLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"登录"];
    
}



#pragma mark - Private Method
-(void)loginBtnAction:(UIButton*)sender
{
    
    NSString *account = self.accountFieldControl.text;
    NSString *pwd = self.pwdFieldControl.text;

    
    if ([account isEqualToString:@""])
    {
        [MBHUD showError:@"账号不能为空"];
    }
    else if ([pwd isEqualToString:@""])
    {
        [MBHUD showError:@"密码不能为空"];
    }
    else
    {

        NSDictionary *parameters = @{@"password":pwd,@"name":account};
        
        
        [[ZSKJAFHTTPManager shareManager] postUrl:Login_URL parameters:parameters success:^(NSDictionary * _Nullable responseObject)
        {
            ZSKJNetworkModel *netWorkModel = [ZSKJNetworkModel mj_objectWithKeyValues:responseObject];
            if (netWorkModel.code.integerValue == 1)
            {
                [self setLoginRoot:YES];
                [[ZSKJUserinfoModel shareUserinfo] setToken:netWorkModel.data];
            }
        } failure:^(NSError * _Nonnull error){}];
    }
    
    
    
    
    
    
    
    
    
   
    
    
    
    
    
}



-(void)addSubVies:(BOOL)views
{
    if (views)
    {
        [self.view addSubview:self.logoImageView];
        [self.view addSubview:self.backView];
        [self.backView addSubview:self.accountFieldControl];
        [self.backView addSubview:self.pwdFieldControl];
        [self.view addSubview:self.loginBtn];
        [self.view addSubview:self.forgetBtn];
        
        
        [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.view.mas_top).offset((100));
            make.centerX.mas_equalTo(self.view.mas_centerX);
            make.width.height.equalTo(@((50)));
        }];
        
        
        [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.logoImageView.mas_bottom).offset(20);
            make.left.equalTo(self.view.mas_left).offset(15);
            make.right.equalTo(self.view.mas_right).offset(-(20));
            make.height.equalTo(@(160));

        }];
        
        [self.accountFieldControl mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.backView.mas_top).offset((22));
            make.left.equalTo(self.backView.mas_left).offset((20));
            make.right.equalTo(self.backView.mas_right).offset(-(20));
            make.height.equalTo(@(60));
        }];
        
        
        [self.pwdFieldControl mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.accountFieldControl.mas_bottom).offset(5);
            make.left.height.right.equalTo(self.accountFieldControl);
        }];
        
        [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.backView.mas_bottom).offset((20));
            make.left.right.equalTo(self.backView);
            make.height.equalTo(@((50)));
        }];
        
        [self.forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {

            make.top.equalTo(self.loginBtn.mas_bottom).offset(20);
            make.left.equalTo(self.backView.mas_left);
            make.height.equalTo(@((30)));
        }];

        
        
        
        
        
        
    }
}



#pragma mark - Getter / Setter
-(UIImageView *)logoImageView
{
    if (!_logoImageView)
    {
        _logoImageView = [[UIImageView alloc]init];
        [_logoImageView setBackgroundColor:KLineColor];
    }
    return _logoImageView;
}




-(UIView *)backView
{
    if (!_backView)
    {
        _backView = [[UIView alloc]init];
        [_backView setBackgroundColor:[UIColor whiteColor]];
        [_backView setCornerRadius:CornerRadius_5];
    }
    return _backView;
}


-(ZSKJTextFieldControl *)accountFieldControl
{
    if (!_accountFieldControl)
    {
        _accountFieldControl = [[ZSKJTextFieldControl alloc]initType:2];
        [_accountFieldControl setPlaceholder:@"请输入账号"];
        [_accountFieldControl setIcon:@"account"];
    }
    return _accountFieldControl;
}




-(ZSKJTextFieldControl *)pwdFieldControl
{
    if (!_pwdFieldControl)
    {
        _pwdFieldControl = [[ZSKJTextFieldControl alloc]initType:2];
        [_pwdFieldControl setSecureTextEntry:YES];
        [_pwdFieldControl setPlaceholder:@"请输入密码"];
        [_pwdFieldControl setIcon:@"password"];
        [_pwdFieldControl setLineHidden:YES];
    }
    return _pwdFieldControl;
}



-(UIButton *)loginBtn
{
    if (!_loginBtn)
    {
        _loginBtn = [[UIButton alloc]init];
        [_loginBtn setBackgroundColor:KMainColor];
        [_loginBtn setTitleColor:KWhiteColor forState:UIControlStateNormal];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(loginBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_loginBtn setCornerRadius:25.0];
    }
    return _loginBtn;
}



-(UIButton *)forgetBtn
{
    if (!_forgetBtn)
    {
        _forgetBtn = [[UIButton alloc]init];
        [_forgetBtn setTitleColor:KTextColor forState:UIControlStateNormal];
        [_forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetBtn addTarget:self action:@selector(loginBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetBtn;
}



@end
