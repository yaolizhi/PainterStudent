//
//  ZSKJNoticeDetailsViewController.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/30.
//

#import "ZSKJNoticeDetailsViewController.h"

@interface ZSKJNoticeDetailsViewController ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;



@end

@implementation ZSKJNoticeDetailsViewController


- (instancetype)initWithType:(NoticeDetailsType)type
{
    self = [super init];
    if (self)
    {
        switch (type)
        {
            case NoticeCourseType:
            {
                [self setTitle:@"课程通知"];
            }
                break;
            case NoticeSystemType:
            {
                [self setTitle:@"系统通知"];
            }
                break;
        }
        
    }
    return self;
}





- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.titleLabel setText:@"请假通知"];
    [self.contentLabel setText:@"张明明请假，课程时间：2020-11-17 16:00-17:00，课程名：狗狗与小鸟。张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，张明明请假通知详细信息显示内容，"];
    
    
}


- (void)addSubVies:(BOOL)views
{
    if (views)
    {
        [self.view addSubview:self.bgView];
        [self.bgView addSubview:self.titleLabel];
        [self.bgView addSubview:self.contentLabel];
        
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.view.mas_top).offset(self.navbarHeight+10);
            make.left.right.equalTo(self.view);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.bgView.mas_left).offset(15);
            make.top.equalTo(self.bgView.mas_top).offset(20);
            make.right.equalTo(self.bgView.mas_right).offset(-15);
        }];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.titleLabel.mas_bottom).offset(20);
            make.left.equalTo(self.titleLabel);
            make.right.equalTo(self.titleLabel.mas_right);
            make.bottom.equalTo(self.bgView.mas_bottom).offset(-30);
        }];
    }
}





#pragma mark - Getter / Setter
-(UIView *)bgView
{
    if (!_bgView)
    {
        _bgView = [[UIView alloc]init];
        [_bgView setBackgroundColor:KWhiteColor];
    }
    return _bgView;
}

-(UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
        [_titleLabel setTextColor:KTextColor];
    }
    return _titleLabel;
}

-(UILabel *)contentLabel
{
    if (!_contentLabel)
    {
        _contentLabel = [[UILabel alloc]init];
        [_contentLabel setFont:[UIFont systemFontOfSize:16]];
        [_contentLabel setTextColor:KSubTextColor];
        [_contentLabel setNumberOfLines:0];
    }
    return _contentLabel;
}









@end
