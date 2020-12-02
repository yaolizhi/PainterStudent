//
//  ZSKJMineinformationViewController.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/23.
//

#import "ZSKJMineinformationViewController.h"
#import "ZSKJMineinformationCellItemControl.h"


@interface ZSKJMineinformationViewController ()

@property (nonatomic, strong) ZSKJMineinformationCellItemControl *headerControl;
@property (nonatomic, strong) ZSKJMineinformationCellItemControl *nameControl;
@property (nonatomic, strong) ZSKJMineinformationCellItemControl *genderControl;
@property (nonatomic, strong) ZSKJMineinformationCellItemControl *ageControl;
@property (nonatomic, strong) ZSKJMineinformationCellItemControl *areaControl;
@property (nonatomic, strong) ZSKJMineinformationCellItemControl *uidControl;





@end

@implementation ZSKJMineinformationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"我的"];
    
    [self.headerControl setIcon:@"" title:@"头像" accessory:@""];
    [self.nameControl setTitle:@"姓名" subtitle:@"姚立志"];
    [self.genderControl setTitle:@"性别" subtitle:@"男"];
    [self.ageControl setTitle:@"年龄" subtitle:@"12"];
    [self.areaControl setTitle:@"地域" subtitle:@"郑州"];
    [self.uidControl setTitle:@"UID" subtitle:@"489892902"];
    
    
}



- (void)addSubVies:(BOOL)views
{
    if (views)
    {
        [self.view addSubview:self.headerControl];
        [self.view addSubview:self.nameControl];
        [self.view addSubview:self.genderControl];
        [self.view addSubview:self.ageControl];
        [self.view addSubview:self.areaControl];
        [self.view addSubview:self.uidControl];
        
        [self.headerControl mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.view.mas_top).offset(80);
            make.left.right.equalTo(self.view);
            make.height.equalTo(@(50));
        }];
        
        [self.nameControl mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.headerControl.mas_bottom);
            make.left.height.right.equalTo(self.headerControl);
        }];
        
        [self.genderControl mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.nameControl.mas_bottom);
            make.left.height.right.equalTo(self.headerControl);
        }];
        
        [self.ageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.genderControl.mas_bottom);
            make.left.height.right.equalTo(self.headerControl);
        }];
        
        
        [self.areaControl mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.ageControl.mas_bottom);
            make.left.height.right.equalTo(self.headerControl);
        }];
        
        [self.uidControl mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.areaControl.mas_bottom);
            make.left.height.right.equalTo(self.headerControl);
        }];
        
        
        
    }
}





#pragma mark - Getter / Setter
-(ZSKJMineinformationCellItemControl *)headerControl
{
    if (!_headerControl)
    {
        _headerControl = [[ZSKJMineinformationCellItemControl alloc]initType:2];
    }
    return _headerControl;
}


-(ZSKJMineinformationCellItemControl *)nameControl
{
    if (!_nameControl)
    {
        _nameControl = [[ZSKJMineinformationCellItemControl alloc]initType:1];
    }
    return _nameControl;
}

-(ZSKJMineinformationCellItemControl *)genderControl
{
    if (!_genderControl)
    {
        _genderControl = [[ZSKJMineinformationCellItemControl alloc]initType:1];
    }
    return _genderControl;
}

-(ZSKJMineinformationCellItemControl *)ageControl
{
    if (!_ageControl)
    {
        _ageControl = [[ZSKJMineinformationCellItemControl alloc]initType:1];
    }
    return _ageControl;
}

-(ZSKJMineinformationCellItemControl *)areaControl
{
    if (!_areaControl)
    {
        _areaControl = [[ZSKJMineinformationCellItemControl alloc]initType:1];
    }
    return _areaControl;
}

-(ZSKJMineinformationCellItemControl *)uidControl
{
    if (!_uidControl)
    {
        _uidControl = [[ZSKJMineinformationCellItemControl alloc]initType:1];
    }
    return _uidControl;
}





@end
