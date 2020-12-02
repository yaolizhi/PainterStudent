//
//  ZSKJSetPwdViewController.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/23.
//

#pragma mark 设置密码


#import "ZSKJSetPwdViewController.h"
#import "ZSKJTextFieldControl.h"
#import "ZSKJDefaultAlertView.h"



@interface ZSKJSetPwdViewController ()


@property (nonatomic, strong) ZSKJTextFieldControl *originalPwdControl;
@property (nonatomic, strong) ZSKJTextFieldControl *newPwdControl;
@property (nonatomic, strong) ZSKJTextFieldControl *confirmPwdControl;
@property (nonatomic, strong) UIButton *submitBtn;


@end

@implementation ZSKJSetPwdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"修改密码"];
}


- (void)addSubVies:(BOOL)views
{
    if (views)
    {
        [self.view addSubview:self.originalPwdControl];
        [self.view addSubview:self.newPwdControl];
        [self.view addSubview:self.confirmPwdControl];
        [self.view addSubview:self.submitBtn];
        
        [self.originalPwdControl mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.view).offset(self.navbarHeight);
            make.left.right.equalTo(self.view);
            make.height.equalTo(@(60));
        }];
        
        
        [self.newPwdControl mas_makeConstraints:^(MASConstraintMaker *make) {

            make.top.equalTo(self.originalPwdControl.mas_bottom);
            make.left.right.equalTo(self.view);
            make.height.equalTo(self.originalPwdControl);

        }];


        [self.confirmPwdControl mas_makeConstraints:^(MASConstraintMaker *make) {

            make.top.equalTo(self.newPwdControl.mas_bottom);
            make.left.right.equalTo(self.view);
            make.height.equalTo(self.originalPwdControl);

        }];
        
        
        [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {

            make.top.equalTo(self.confirmPwdControl.mas_bottom).offset(30);
            make.left.equalTo(self.view.mas_left).offset(20);
            make.right.equalTo(self.view.mas_right).offset(-20);
            make.height.equalTo(self.originalPwdControl);

        }];
    }
}



#pragma mark 登录
-(void)submitBtnAction:(UIButton*)sender
{
    [ZSKJDefaultAlertView showWithTitle:@"密码修改成功！" witIcon:@"tipSucceed" submitBlock:^(BOOL action) {
        
       
        
        
        
    }];
    
}



#pragma mark - Getter / Setter
-(ZSKJTextFieldControl *)originalPwdControl
{
    if (!_originalPwdControl)
    {
        _originalPwdControl = [[ZSKJTextFieldControl alloc]initType:1];
        [_originalPwdControl setTitle:@"原密码"];
        [_originalPwdControl setPlaceholder:@"请输入原密码"];
    }
    return _originalPwdControl;
}

-(ZSKJTextFieldControl *)newPwdControl
{
    if (!_newPwdControl)
    {
        _newPwdControl = [[ZSKJTextFieldControl alloc]initType:1];
        [_newPwdControl setTitle:@"新密码"];
        [_newPwdControl setPlaceholder:@"请输入新密码"];
    }
    return _newPwdControl;
}


-(ZSKJTextFieldControl *)confirmPwdControl
{
    if (!_confirmPwdControl)
    {
        _confirmPwdControl = [[ZSKJTextFieldControl alloc]initType:1];
        [_confirmPwdControl setTitle:@"确认新密码"];
        [_confirmPwdControl setPlaceholder:@"请确认密码"];
    }
    return _confirmPwdControl;
}


-(UIButton *)submitBtn
{
    if (!_submitBtn)
    {
        _submitBtn = [[UIButton alloc]init];
        [_submitBtn setTitle:@"确认修改" forState:UIControlStateNormal];
        [_submitBtn addTarget:self action:@selector(submitBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_submitBtn setBackgroundColor:KMainColor];
        [_submitBtn setTitleColor:KWhiteColor forState:UIControlStateNormal];
        [_submitBtn setCornerRadius:25];
    }
    return _submitBtn;
}


@end
