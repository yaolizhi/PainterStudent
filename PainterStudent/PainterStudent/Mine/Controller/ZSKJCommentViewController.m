//
//  ZSKJCommentViewController.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/12/1.
//

#import "ZSKJCommentViewController.h"
#import "ZSKJAudioStatusBoardControl.h"
#import "ZSKJAudioBubbleBoardControl.h"
#import "ZSKJAudioBtnControl.h"



@interface ZSKJCommentViewController () <ZSKJAudioBtnControlDeletage>

@property (nonatomic, strong) UIView *topBoardView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *headerView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *preView;


@property (nonatomic, strong) UIView *bottomBoardView;
@property (nonatomic, strong) ZSKJAudioBubbleBoardControl *bubbleBoardControl;
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UIView *lineView;


@property (nonatomic, strong) ZSKJAudioStatusBoardControl *audioBoardControl;
@property (nonatomic, strong) ZSKJAudioTool *audioTool;





















@end

@implementation ZSKJCommentViewController

#pragma mark - LifeCycle Method
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"课程学习报告"];
    
    [self getReadReport];
}


-(void)addSubVies:(BOOL)views
{
    if (views)
    {
        [self.view addSubview:self.topBoardView];
        [self.topBoardView addSubview:self.titleLabel];
        [self.topBoardView addSubview:self.headerView];
        [self.topBoardView addSubview:self.nameLabel];
        [self.topBoardView addSubview:self.preView];
        
        
        [self.view addSubview:self.bottomBoardView];
        [self.bottomBoardView addSubview:self.tipLabel];
        [self.bottomBoardView addSubview:self.lineView];
        [self.bottomBoardView addSubview:self.bubbleBoardControl];
        
        
        
        
        [self.topBoardView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            
            make.top.equalTo(self.view.mas_top).offset(self.navbarHeight+15);
            make.left.right.equalTo(self.view);
            make.height.equalTo(@(650));
            
        }];
        
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {

            make.top.equalTo(self.topBoardView.mas_top).offset(25);
            make.left.equalTo(self.topBoardView.mas_left).offset(15);
        }];

        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {

            make.top.equalTo(self.titleLabel);
            make.right.equalTo(self.topBoardView.mas_right).offset(-15);
        }];


        [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.right.equalTo(self.nameLabel.mas_left).offset(-15);
            make.centerY.equalTo(self.titleLabel);
            make.width.height.equalTo(@(40));
        }];


        [self.preView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.top.equalTo(self.titleLabel.mas_bottom).offset(25);
            make.left.equalTo(self.titleLabel);
            make.right.equalTo(self.nameLabel.mas_right);
            make.bottom.equalTo(self.topBoardView.mas_bottom).offset(-25);
        }];
        
        
        [self.bottomBoardView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.topBoardView.mas_bottom).offset(15);
            make.left.right.equalTo(self.view);
            make.height.equalTo(@(130));
        }];
        
        
        [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.top.equalTo(self.bottomBoardView).offset(15);
        }];
        
        
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self.bottomBoardView.mas_top).offset(44);
            make.left.right.equalTo(self.bottomBoardView);
            make.height.equalTo(@(1));
        }];
                
        
        [self.bubbleBoardControl mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.equalTo(self.tipLabel);
            make.width.equalTo(@(300));
            make.height.equalTo(@(50));
            make.bottom.equalTo(self.bottomBoardView.mas_bottom).offset(-18);
                    
        }];
    }
}






#pragma mark - NetWork Method 网络请求
#pragma mark 获取报告详情
-(void)getReadReport
{
    NSDictionary *parameters = @{@"report_id":self.model.course_id};
    [[ZSKJAFHTTPManager shareManager] postUrl:ReadReport_URL parameters:parameters success:^(id  _Nonnull responseObject){
        
        ZSKJNetworkModel *netWorkModel = [ZSKJNetworkModel mj_objectWithKeyValues:responseObject];
        if (netWorkModel.code.integerValue == 1)
        {
            [self analyNetWorkModel:netWorkModel];
        }
        
    } failure:^(NSError * _Nonnull error) {}];
}


#pragma mark 解析数据
-(void)analyNetWorkModel:(ZSKJNetworkModel*)model
{
    NSString *user_report = [model.data objectForKey:@"user_report"]; //用户作品
    NSString *teacher_comment = [model.data objectForKey:@"teacher_comment"]; //教师点评
    NSString *user_name = [model.data objectForKey:@"user_name"]; //用户名字
    NSString *user_age = [model.data objectForKey:@"user_age"]; //年龄
    NSString *user_headimgurl = [model.data objectForKey:@"user_headimgurl"]; //头像
    
    
    [self.preView sd_setImageWithURL:[NSURL URLWithString:user_report]];
    [self.nameLabel setText:[NSString stringWithFormat:@"%@ (%@岁)",user_name,user_age]];
    [self.headerView sd_setImageWithURL:[NSURL URLWithString:user_headimgurl]];
}


































#pragma mark - Deletage Method

#pragma mark 手指按下
-(void)recordTouchDownAction:(ZSKJAudioBtnControl *)sender
{
    [self.audioBoardControl showWithTitle:@"手指上滑 取消发送" witIcon:@"shuohua_one" withImages:@[[UIImage imageNamed:@"shuohua_one"],[UIImage imageNamed:@"shuohua_two"],[UIImage imageNamed:@"shuohua_three"]] isAnimation:YES];
    [self.audioBoardControl show];
    [self.audioTool setName:@"1234"];
    [self.audioTool startRecord];

}

#pragma mark 手指滑出按钮 取消录音 按下按钮，并且在按钮外部（outside）松手
/// 手指滑出按钮 取消录音 按下按钮，并且在按钮外部（outside）松手
/// @param sender 当前对象
-(void)recordTouchUpOutsideAction:(ZSKJAudioBtnControl*)sender
{
    [self.audioBoardControl hide];
    [self.audioTool stopRecord];
}

#pragma mark 手指抬起 取消录音 按下按钮，并且在按钮内部（inside）松手
/// 手指抬起 取消录音 按下按钮，并且在按钮内部（inside）松手
/// @param sender 当前对象
-(void)recordTouchUpInsideAction:(UIControl*)sender
{
    [self.audioBoardControl hide];
    NSLog(@"点评完成，录音时长为%f",self.audioTool.recordTime);
    /**
     必须在stopRecord之前才有效
     */
    [self.bubbleBoardControl recordTime:self.audioTool.recordTime];
    
    [self.audioTool stopRecord];
    [self.bubbleBoardControl setHidden:NO];
}






#pragma mark 手指从外部划入按钮内部范围（持续性），但未松开
/// 手指从外部划入按钮内部范围（持续性），但未松开
/// @param sender 当前对象
-(void)recordTouchDragEnterAction:(UIControl*)sender
{
    [self.audioBoardControl showWithTitle:@"手指上滑 取消发送" witIcon:@"shuohua_one" withImages:@[[UIImage imageNamed:@"shuohua_one"],[UIImage imageNamed:@"shuohua_two"],[UIImage imageNamed:@"shuohua_three"]] isAnimation:YES];
    
}


#pragma mark 手指从内部划出按钮内部的动作（一次性）
/// 手指从内部划出按钮内部的动作（一次性）
/// @param sender 当前对象
-(void)recordTouchDragExitAction:(UIControl*)sender
{
    [self.audioBoardControl showWithTitle:@"松开手指 取消发送" witIcon:@"quxiao" withImages:@[] isAnimation:NO];
}


#pragma mark - Private Method

-(void)bubbleAction:(ZSKJAudioBubbleBoardControl*)sender
{
    [sender startPlayWithName:@"1234"];
}




















#pragma mark - Getter / Setter
-(UIView *)topBoardView
{
    if (!_topBoardView)
    {
        _topBoardView = [[UIView alloc]init];
        [_topBoardView setBackgroundColor:KWhiteColor];
    }
    return _topBoardView;
}


-(UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
        [_titleLabel setTextColor:KTextColor];
        [_titleLabel setText:@"课堂作品"];
    }
    return _titleLabel;
}



-(UIImageView *)headerView
{
    if (!_headerView)
    {
        _headerView = [[UIImageView alloc]init];
        [_headerView setBackgroundColor:KLineColor];
        [_headerView setCornerRadius:20];
    }
    return _headerView;
}

-(UIImageView *)preView
{
    if (!_preView)
    {
        _preView = [[UIImageView alloc]init];
        [_preView setBackgroundColor:KLineColor];
        [_preView setImageName:@"banner3"];
        [_preView setContentMode:UIViewContentModeScaleAspectFill];
        [_preView setMasksToBounds:YES];
    }
    return _preView;
}



-(UILabel *)nameLabel
{
    if (!_nameLabel)
    {
        _nameLabel = [[UILabel alloc]init];
        [_nameLabel setFont:[UIFont systemFontOfSize:15]];
        [_nameLabel setTextColor:KTextColor];
        [_nameLabel setText:@"张明明（7岁）"];
    }
    return _nameLabel;
}



-(UIView *)bottomBoardView
{
    if (!_bottomBoardView)
    {
        _bottomBoardView = [[UIView alloc]init];
        [_bottomBoardView setBackgroundColor:KWhiteColor];
    }
    return _bottomBoardView;
}



-(UILabel *)tipLabel
{
    if (!_tipLabel)
    {
        _tipLabel = [[UILabel alloc]init];
        [_tipLabel setFont:[UIFont boldSystemFontOfSize:18]];
        [_tipLabel setTextColor:KTextColor];
        [_tipLabel setText:@"语音点评"];
    }
    return _tipLabel;
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





-(ZSKJAudioStatusBoardControl *)audioBoardControl
{
    if (!_audioBoardControl)
    {
        _audioBoardControl = [[ZSKJAudioStatusBoardControl alloc]init];
    }
    return _audioBoardControl;
}


-(ZSKJAudioTool *)audioTool
{
    if (!_audioTool)
    {
        _audioTool = [[ZSKJAudioTool alloc]init];
    }
    return _audioTool;
}

-(ZSKJAudioBubbleBoardControl *)bubbleBoardControl
{
    if (!_bubbleBoardControl)
    {
        _bubbleBoardControl = [[ZSKJAudioBubbleBoardControl alloc]init];
        [_bubbleBoardControl addTarget:self action:@selector(bubbleAction:) forControlEvents:UIControlEventTouchUpInside];
        [_bubbleBoardControl setCornerRadius:25];
    }
    return _bubbleBoardControl;
}


















@end
