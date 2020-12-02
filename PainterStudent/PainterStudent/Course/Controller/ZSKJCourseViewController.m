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



@interface ZSKJCourseViewController () <ZSKJCourseOptionControlDeletage>

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
        [self.view addSubview:self.alreadyableView];
        [self.view addSubview:self.readyTableView];
        [self.alreadyableView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(self.courseOptionControl.bottom, 0, self.tabbarHeight, 0));
                    
        }];
        
        
        [self.readyTableView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(self.courseOptionControl.bottom, 0, self.tabbarHeight, 0));
                    
        }];
    }
}


#pragma mark - Deletage Method
#pragma mark ZSKJCourseOptionControlDeletage
-(void)optionItemAction:(NSInteger)index
{
    [self.alreadyableView setHidden:YES];
    [self.readyTableView setHidden:YES];
    switch (index)
    {
        case 0:
        {
            [self.readyTableView setHidden:NO];
        }
            break;
        case 1:
        {
            [self.alreadyableView setHidden:NO];
        }
            break;
    }
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
        _readyTableView = [[ZSKJCourseReadyTableView alloc]init];
    }
    return _readyTableView;
}


-(ZSKJCourseAlreadyTableView *)alreadyableView
{
    if (!_alreadyableView)
    {
        _alreadyableView = [[ZSKJCourseAlreadyTableView alloc]init];
    }
    return _alreadyableView;
}



@end
