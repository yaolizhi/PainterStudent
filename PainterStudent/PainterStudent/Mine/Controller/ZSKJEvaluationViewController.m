//
//  ZSKJEvaluationViewController.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/20.
//

#import "ZSKJEvaluationViewController.h"
#import "ZSKJCourseOptionControl.h"
#import "ZSKJEvaluationTableView.h"
#import "ZSKJCommentViewController.h"







@interface ZSKJEvaluationViewController () <ZSKJCourseOptionControlDeletage,ZSKJOptionScrollViewDeletage,ZSKJEvaluationTableViewDeletage>



@property (nonatomic, strong) ZSKJCourseOptionControl *optionControl;
@property (nonatomic, strong) ZSKJOptionScrollView *optionScrollView;
@property (nonatomic, strong) ZSKJEvaluationTableView *formalTableView;//!< 正式课程
@property (nonatomic, strong) ZSKJEvaluationTableView *auditionlTableView; //!< 试听课程

@end

@implementation ZSKJEvaluationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"学习报告"];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated bottomBar:NO];
}



- (void)addSubVies:(BOOL)views
{
    if (views)
    {
        [self.view addSubview:self.optionControl];
        [self.view addSubview:self.optionScrollView];
        [self.optionScrollView addSubview:self.formalTableView];
        [self.optionScrollView addSubview:self.auditionlTableView];
    }
}






#pragma mark - Deletage Method
#pragma mark ZSKJCourseOptionControlDeletage
-(void)optionItemAction:(NSInteger)index
{
    [self.optionScrollView setContentOffPage:index];
}


#pragma mark ZSKJOptionScrollViewDeletage
-(void)optionScrollPage:(NSInteger)page
{
    [self.optionControl setIndexTag:page];
}


#pragma mark ZSKJEvaluationTableViewDeletage
-(void)didSelectEvaluationItem:(ZSKJEvaluationModel *)model
{
    ZSKJCommentViewController *comment = [[ZSKJCommentViewController alloc]init];
    [comment setModel:model];
    [self pushViewController:comment animated:YES];
}










#pragma mark - Getter / Setter
-(ZSKJCourseOptionControl *)optionControl
{
    if (_optionControl == nil)
    {
        _optionControl = [[ZSKJCourseOptionControl alloc]initWithFrame:CGRectMake(0, self.navbarHeight, ScreenWidth, 50) withDeletage:self];
        [_optionControl setOneTitle:@"正式课报告" withTwoTitle:@"试听课报告"];

    }
    return _optionControl;
}


-(ZSKJOptionScrollView *)optionScrollView
{
    if (!_optionScrollView)
    {
        _optionScrollView = [[ZSKJOptionScrollView alloc]initWithFrame:CGRectMake(0, self.optionControl.bottom, ScreenWidth, (ScreenHeight-self.optionControl.bottom)) witDeletage:self];
        [_optionScrollView setContentSize:CGSizeMake((ScreenWidth*2), (ScreenHeight-self.optionControl.bottom))];
    }
    return _optionScrollView;
}



-(ZSKJEvaluationTableView *)formalTableView
{
    if (!_formalTableView)
    {
        _formalTableView = [[ZSKJEvaluationTableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, self.optionScrollView.height) witDeletage:self];
        [_formalTableView  setInitType:FormalType withDeletage:self];
    }
    return _formalTableView;
}

-(ZSKJEvaluationTableView *)auditionlTableView
{
    if (!_auditionlTableView)
    {
        _auditionlTableView = [[ZSKJEvaluationTableView alloc]initWithFrame:CGRectMake(self.formalTableView.right, 0, ScreenWidth, self.optionScrollView.height) witDeletage:self];
        [_auditionlTableView setInitType:AuditionlType withDeletage:self];
    }
    return _auditionlTableView;
}

@end
