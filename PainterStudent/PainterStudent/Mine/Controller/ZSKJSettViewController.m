//
//  ZSKJSettViewController.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/23.
//

#import "ZSKJSettViewController.h"
#import "ZSKJMineinformationCellItemControl.h"
#import "ZSKJSetPwdViewController.h"

@interface ZSKJSettViewController ()

@property (nonatomic, strong) ZSKJMineinformationCellItemControl *setpwdControl;
@property (nonatomic, strong) ZSKJMineinformationCellItemControl *versionControl;



@end

@implementation ZSKJSettViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"设置"];
}


#pragma mark - Private Method
-(void)itemAction:(UIControl*)sender
{
    ZSKJSetPwdViewController *setpwd = [[ZSKJSetPwdViewController alloc]init];
    [self pushViewController:setpwd animated:YES];
    
}





- (void)addSubVies:(BOOL)views
{
    if (views)
    {
        [self.view addSubview:self.setpwdControl];
        [self.view addSubview:self.versionControl];
        
        [self.setpwdControl mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.view.mas_top).offset(self.navbarHeight);
            make.left.right.equalTo(self.view);
            make.height.mas_equalTo(@(60));

        }];
        
        
        [self.versionControl mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.setpwdControl.mas_bottom);
            make.left.height.right.equalTo(self.setpwdControl);

        }];
    }
    
    
}


#pragma mark - Getter / Setter
-(ZSKJMineinformationCellItemControl *)setpwdControl
{
    if (!_setpwdControl)
    {
        _setpwdControl = [[ZSKJMineinformationCellItemControl alloc]initType:3];
        [_setpwdControl setIcon:@"arrowRight" title:@"修改密码" accessory:@"arrowRight"];
        [_setpwdControl setTitle:@"修改密码"];
        [_setpwdControl setTag:1];
        [_setpwdControl addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _setpwdControl;
}

-(ZSKJMineinformationCellItemControl *)versionControl
{
    if (!_versionControl)
    {
        _versionControl = [[ZSKJMineinformationCellItemControl alloc]initType:1];
        [_versionControl setTitle:@"版本号" subtitle:@"1.0.1"];
    }
    return _versionControl;
}








@end
