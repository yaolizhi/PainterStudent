//
//  ZSKJMineViewController.m
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/2.
//

#import "ZSKJMineViewController.h"
#import "ZSKJLoginViewController.h"
#import "ZSKJMineCellItemControl.h"
#import "ZSKJMineNoticeControl.h"
#import "ZSKJDeviceAlertView.h"
#import "ZSKJMineinformationViewController.h" //!< 个人信息
#import "ZSKJMineServiceViewController.h" //!< 客服
#import "ZSKJSettViewController.h" //!< 设置
#import "ZSKJTemporaryViewController.h"  //!<临时课堂
#import "ZSKJNoticeViewController.h" //!< 我的消息
#import "ZSKJCreationViewController.h" //!< 我的作品
#import "ZSKJEvaluationViewController.h" //!< 学习报告
#import "ZSKJMineHeaderItemOptoonControl.h" //!< 我的作品、剩余课时、剩余请假次数










@interface ZSKJMineViewController ()

@property (nonatomic, strong) UIImageView *headerBgView;
@property (nonatomic, strong) UIImageView *headerView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *uidLabel;
@property (nonatomic, strong) ZSKJMineNoticeControl *noticeControl; //!< 消息


@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) ZSKJMineHeaderItemOptoonControl *opusOptoonControl; //!< 作品
@property (nonatomic, strong) ZSKJMineHeaderItemOptoonControl *periodOptoonControl; //!< 剩余课时
@property (nonatomic, strong) ZSKJMineHeaderItemOptoonControl *leaveOptoonControl; //!< 请假次数
@property (nonatomic, strong) NSMutableArray *masonryViewArray;


@property (nonatomic, strong) ZSKJMineCellItemControl *studyReportItems; //!< 学习报告
@property (nonatomic, strong) ZSKJMineCellItemControl *deviceItems; //!< 设备检测
@property (nonatomic, strong) ZSKJMineCellItemControl *temporaryItems; //!< 临时课堂
@property (nonatomic, strong) ZSKJMineCellItemControl *serviceItems; //!< 客服
@property (nonatomic, strong) ZSKJMineCellItemControl *settItems; //!< 设置



@end

@implementation ZSKJMineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"我的"];
    [self.opusOptoonControl setNum:@"16"];
    [self.periodOptoonControl setNum:@"321"];
    [self.leaveOptoonControl setNum:@"56"];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated bottomBar:NO];
}

-(void)addSubVies:(BOOL)views
{
    if (views)
    {
        [self.view addSubview:self.headerBgView];
        [self.headerBgView addSubview:self.headerView];
        [self.headerBgView addSubview:self.nameLabel];
        [self.headerBgView addSubview:self.uidLabel];
        [self.headerBgView addSubview:self.noticeControl];
        [self.view addSubview:self.bgView];
        [self.bgView addSubview:self.opusOptoonControl];
        [self.bgView addSubview:self.periodOptoonControl];
        [self.bgView addSubview:self.leaveOptoonControl];
        [self.masonryViewArray addObject:self.opusOptoonControl];
        [self.masonryViewArray addObject:self.periodOptoonControl];
        [self.masonryViewArray addObject:self.leaveOptoonControl];
        
        
        [self.view addSubview:self.studyReportItems];
        [self.view addSubview:self.temporaryItems];
        [self.view addSubview:self.deviceItems];
        [self.view addSubview:self.serviceItems];
        [self.view addSubview:self.settItems];
        
        [self.headerBgView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.view).offset(self.navbarHeight);
            make.left.right.equalTo(self.view);
            make.height.equalTo(@(300));
            
        }];
        
        [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerX.equalTo(self.headerBgView.mas_centerX);
            make.bottom.equalTo(self.headerBgView.mas_centerY);
            make.width.height.equalTo(@(50));
        }];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {

            make.top.equalTo(self.headerView.mas_bottom).offset(15);
            make.centerX.equalTo(self.headerBgView.mas_centerX);
                    
        }];
        
        [self.uidLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.nameLabel.mas_bottom).offset(15);
            make.centerX.equalTo(self.headerBgView.mas_centerX);
                    
        }];
        
        
        
        [self.noticeControl mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.headerBgView.mas_top).offset(20);
            make.right.equalTo(self.headerBgView.mas_right).offset(-15);
            make.width.height.equalTo(@(40));
                    
        }];
        
        
        
        
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.centerY.equalTo(self.headerBgView.mas_bottom);
            make.left.equalTo(self.view.mas_left).offset(15);
            make.right.equalTo(self.view.mas_right).offset(-15);
            make.height.equalTo(@(120));
                    
        }];
        
        
        
        [self.masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
            
        // 设置array的垂直方向的约束
        [self.masonryViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
        
            make.top.equalTo(@(0));
            make.height.equalTo(@(120));
        }];
    
        
        [self.studyReportItems mas_makeConstraints:^(MASConstraintMaker *make) {
        
            make.top.equalTo(self.bgView.mas_bottom).offset(15);
            make.left.equalTo(self.view.mas_left).offset(15);
            make.right.equalTo(self.view.mas_right).offset(-15);
            make.height.equalTo(@(60));
            
        }];
        
     
        
        
        [self.temporaryItems mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.studyReportItems.mas_bottom);
            make.left.height.right.equalTo(self.studyReportItems);
        }];
        
       
        
        [self.deviceItems mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.temporaryItems.mas_bottom);
            make.left.height.right.equalTo(self.studyReportItems);
        }];
        
        [self.serviceItems mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.deviceItems.mas_bottom);
            make.left.height.right.equalTo(self.studyReportItems);
        }];
        
        
        [self.settItems mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.serviceItems.mas_bottom);
            make.left.height.right.equalTo(self.studyReportItems);
        }];
        
        
        
        
    }
}





-(void)itemAction:(UIControl*)sender
{
    switch (sender.tag)
    {
#pragma mark case 1 通知消息
        case 1:
        {
            [self pushViewController:[[ZSKJNoticeViewController alloc]init] animated:YES];
        }
            break;
#pragma mark case 2 我的作品
        case 2:
        {
            ZSKJCreationViewController *set = [[ZSKJCreationViewController alloc]init];
            [self pushViewController:set animated:YES];
        }
            break;
#pragma mark case 3 学习报告
        case 3:
        {
            [self pushViewController:[[ZSKJEvaluationViewController alloc]init] animated:YES];
        }
            break;
#pragma mark case 4 个人信息
        case 4:
        {
            
            
            
            
            

            ZSKJMineinformationViewController *information = [[ZSKJMineinformationViewController alloc]init];
            [self pushViewController:information animated:YES];
            
        }
            break;
#pragma mark case 5 历程
        case 5:
        {
            
        }
            break;
#pragma mark case 6 临时课堂
        case 6:
        {
            [self pushViewController:[[ZSKJTemporaryViewController alloc]init] animated:YES];
        }
            break;
#pragma mark case 7 排课消息
        case 7:
        {
            
        }
            break;
#pragma mark case 8 设备检查
        case 8:
        {
            
            [ZSKJDeviceAlertView showWithTitle:@"" witIcon:@"" submitBlock:^(NSString * _Nonnull code) {
            }];
        }
            break;
#pragma mark case 9 客服
        case 9:
        {
            ZSKJMineServiceViewController *service = [[ZSKJMineServiceViewController alloc]init];
            [self pushViewController:service animated:YES];
        }
            break;
#pragma mark case 10 设置
        case 10:
        {
            ZSKJSettViewController *set = [[ZSKJSettViewController alloc]init];
            [self pushViewController:set animated:YES];
        }
            break;
        
            
        default:
            break;
    }
}













#pragma mark - Getter / Setter
-(UIImageView *)headerBgView
{
    if (!_headerBgView)
    {
        _headerBgView = [[UIImageView alloc]init];
        [_headerBgView setImageName:@"mineBg"];
        [_headerBgView setBackgroundColor:KMainColor];
        [_headerBgView setUserInteractionEnabled:YES];
    }
    return _headerBgView;
}


-(UIImageView *)headerView
{
    if (!_headerView)
    {
        _headerView = [[UIImageView alloc]init];
        [_headerView setImageName:@"mineHeader"];
        [_headerView setCornerRadius:25];
        [_headerView setBackgroundColor:KWhiteColor];
    }
    return _headerView;
}


-(UILabel *)nameLabel
{
    if (!_nameLabel)
    {
        _nameLabel = [[UILabel alloc]init];
        [_nameLabel setTextColor:KWhiteColor];
        [_nameLabel setFont:[UIFont systemFontOfSize:15]];
        [_nameLabel setText:@"李嘉"];
    }
    return _nameLabel;
}


-(UILabel *)uidLabel
{
    if (!_uidLabel)
    {
        _uidLabel = [[UILabel alloc]init];
        [_uidLabel setTextColor:KWhiteColor];
        [_uidLabel setFont:[UIFont systemFontOfSize:13]];
        [_uidLabel setText:@"ID：508976324"];
    }
    return _uidLabel;
}

-(ZSKJMineNoticeControl *)noticeControl
{
    if (!_noticeControl)
    {
        _noticeControl = [[ZSKJMineNoticeControl alloc]init];
        [_noticeControl setTag:1];
        [_noticeControl addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _noticeControl;
}


-(UIView *)bgView
{
    if (!_bgView)
    {
        _bgView = [[UIView alloc]init];
        [_bgView setBackgroundColor:KWhiteColor];
    }
    return _bgView;
}




-(ZSKJMineHeaderItemOptoonControl *)opusOptoonControl
{
    if (!_opusOptoonControl)
    {
        _opusOptoonControl = [[ZSKJMineHeaderItemOptoonControl alloc]init];
        [_opusOptoonControl setTitle:@"我的作品"];
        [_opusOptoonControl addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
        [_opusOptoonControl setTag:2];
    }
    return _opusOptoonControl;
}


-(ZSKJMineHeaderItemOptoonControl *)periodOptoonControl
{
    if (!_periodOptoonControl)
    {
        _periodOptoonControl = [[ZSKJMineHeaderItemOptoonControl alloc]init];
        [_periodOptoonControl setTitle:@"剩余课时"];
        [_periodOptoonControl addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
        [_periodOptoonControl setTag:3];
    }
    return _periodOptoonControl;
}

-(ZSKJMineHeaderItemOptoonControl *)leaveOptoonControl
{
    if (!_leaveOptoonControl)
    {
        _leaveOptoonControl = [[ZSKJMineHeaderItemOptoonControl alloc]init];
        [_leaveOptoonControl setTitle:@"剩余请假次数"];
        [_leaveOptoonControl addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
        [_leaveOptoonControl setTag:4];
    }
    return _leaveOptoonControl;
}








-(ZSKJMineCellItemControl *)studyReportItems
{
    if (!_studyReportItems)
    {
        _studyReportItems = [[ZSKJMineCellItemControl alloc]init];
        [_studyReportItems setIcon:@"studyReport" title:@"学习报告" accessory:@"arrowRight"];
        [_studyReportItems setTag:3];
        [_studyReportItems addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _studyReportItems;
}







-(ZSKJMineCellItemControl *)temporaryItems
{
    if (!_temporaryItems)
    {
        _temporaryItems = [[ZSKJMineCellItemControl alloc]init];
        [_temporaryItems setIcon:@"temporary" title:@"临时课堂" accessory:@"arrowRight"];
        [_temporaryItems setTag:6];
        [_temporaryItems addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _temporaryItems;
}






-(ZSKJMineCellItemControl *)deviceItems
{
    if (!_deviceItems)
    {
        _deviceItems = [[ZSKJMineCellItemControl alloc]init];
        [_deviceItems setIcon:@"device" title:@"设备检查" accessory:@"arrowRight"];
        [_deviceItems setTag:8];
        [_deviceItems addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deviceItems;
}


-(ZSKJMineCellItemControl *)serviceItems
{
    if (!_serviceItems)
    {
        _serviceItems = [[ZSKJMineCellItemControl alloc]init];
        [_serviceItems setIcon:@"service" title:@"客服" accessory:@"arrowRight"];
        [_serviceItems setTag:9];
        [_serviceItems addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _serviceItems;
}


-(ZSKJMineCellItemControl *)settItems
{
    if (!_settItems)
    {
        _settItems = [[ZSKJMineCellItemControl alloc]init];
        [_settItems setIcon:@"sett" title:@"设置" accessory:@"arrowRight"];
        [_settItems setTag:10];
        [_settItems addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _settItems;
}

- (NSMutableArray *)masonryViewArray
{
    if (!_masonryViewArray)
    {
        
        _masonryViewArray = [NSMutableArray array];
    }
    
    return _masonryViewArray;
}

@end
