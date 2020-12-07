//
//  ZSKJCourseViewController.m
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/2.
//

#import "ZSKJCourseViewController.h"
#import "ZSKJCourseOptionControl.h"
#import "ZSKJCourseReadyTableView.h"
#import "ZSKJCourseAlreadyTableView.h"



@interface ZSKJCourseViewController () <ZSKJCourseOptionControlDeletage,ZSKJOptionScrollViewDeletage>

@property (nonatomic, strong) ZSKJOptionScrollView *optionScrollView; //!< 滚动视图


@property (nonatomic, strong) ZSKJCourseOptionControl *courseOptionControl;
@property (nonatomic, strong) ZSKJCourseReadyTableView *readyTableView;
@property (nonatomic, strong) ZSKJCourseAlreadyTableView *alreadyableView;






@end

@implementation ZSKJCourseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}




- (void)addSubVies:(BOOL)views
{
    if (views)
    {
        [self.view addSubview:self.courseOptionControl];
        [self.view addSubview:self.optionScrollView];
        [self.optionScrollView addSubview:self.alreadyableView];
        [self.optionScrollView addSubview:self.readyTableView];
        
        
        [self.readyTableView beginRefreshing];
        [self.alreadyableView beginRefreshing];
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
    [self.courseOptionControl setIndexTag:page];
}







#pragma mark - Getter / Setter
-(ZSKJCourseOptionControl *)courseOptionControl
{
    if (!_courseOptionControl)
    {
        _courseOptionControl = [[ZSKJCourseOptionControl alloc]initWithFrame:CGRectMake(0, self.navbarHeight, ScreenWidth, 50) withDeletage:self];
        [_courseOptionControl setOneTitle:@"待上课程" withTwoTitle:@"已上课程"];
    }
    return _courseOptionControl;
}


-(ZSKJCourseReadyTableView *)readyTableView
{
    if (!_readyTableView)
    {
        _readyTableView = [[ZSKJCourseReadyTableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, self.optionScrollView.height)];
    }
    return _readyTableView;
}


-(ZSKJCourseAlreadyTableView *)alreadyableView
{
    if (!_alreadyableView)
    {
        _alreadyableView = [[ZSKJCourseAlreadyTableView alloc]initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, self.optionScrollView.height)];
    }
    return _alreadyableView;
}

-(ZSKJOptionScrollView *)optionScrollView
{
    if (!_optionScrollView)
    {
        _optionScrollView = [[ZSKJOptionScrollView alloc]initWithFrame:CGRectMake(0, self.courseOptionControl.bottom, ScreenWidth, (ScreenHeight-(self.courseOptionControl.bottom+self.tabbarHeight))) witDeletage:self];
        [_optionScrollView setContentSize:CGSizeMake(2*ScreenWidth, (ScreenHeight-(self.courseOptionControl.bottom+self.tabbarHeight)))];
    }
    return _optionScrollView;
}



@end
