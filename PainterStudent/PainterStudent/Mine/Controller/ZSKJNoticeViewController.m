//
//  ZSKJNoticeViewController.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/26.
//

#import "ZSKJNoticeViewController.h"
#import "ZSKJNoticeDetailsViewController.h"
#import "ZSKJNoticeTableViewCell.h"
#import "ZSKJNoticeOptionControl.h"



@interface ZSKJNoticeViewController () <UITableViewDelegate,UITableViewDataSource,ZSKJNoticeOptionControlDeletage>


@property (nonatomic, strong) ZSKJNoticeOptionControl *optionControl;
@property (nonatomic, strong) NSMutableArray *itemArray;

@property (nonatomic, strong) SSKJ_TableView *tableView;


@end

@implementation ZSKJNoticeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"消息列表"];
}




-(void)addSubVies:(BOOL)views
{
    if (views)
    {
        [self.view addSubview:self.optionControl];
        [self.view addSubview:self.tableView];
        
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(self.optionControl.bottom, 0, 0, 0));
        }];
        
        
        
        
        
        
        
        
        
    }
}





#pragma mark - Deletage Method
#pragma mark ZSKJNoticeOptionControlDeletage
-(void)optionItemAction:(NSInteger)index
{
    
    
    
}



#pragma mark UITableViewDataSource
- (NSInteger)tableView:(SSKJ_TableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [tableView setItemArray:self.itemArray];
    return [self.itemArray count];
    
}

- (ZSKJNoticeTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ZSKJNoticeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZSKJNoticeTableViewCell"];
    [cell setModel:[self.itemArray objectAtIndex:indexPath.row]];
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110.0;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ZSKJNoticeDetailsViewController *notice = [[ZSKJNoticeDetailsViewController alloc]initWithType:NoticeCourseType];
    [self pushViewController:notice animated:YES];
}
























#pragma mark - Getter / Setter
-(ZSKJNoticeOptionControl *)optionControl
{
    if (!_optionControl)
    {
        _optionControl = [[ZSKJNoticeOptionControl alloc]initWithFrame:CGRectMake(0, self.navbarHeight, ScreenWidth, 50) withDeletage:self];
        [_optionControl setOneTitle:@"课程通知" withTwoTitle:@"系统消息"];
    }
    return _optionControl;
}

-(SSKJ_TableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[SSKJ_TableView alloc]initWitDeletage:self];
        [_tableView registerClass:[ZSKJNoticeTableViewCell class] forCellReuseIdentifier:@"ZSKJNoticeTableViewCell"];
    }
    return _tableView;
}



-(NSMutableArray *)itemArray
{
    if (!_itemArray)
    {
        _itemArray = [NSMutableArray array];
        for (int i = 0; i < 2; i++)
        {
            ZSKJNoticeModel *model = [[ZSKJNoticeModel alloc]init];
            [model setType:UnreadNoticeType];
            [model setTitle:@"取消课程通知"];
            [model setContent:@"吴洋洋取消了课程，课程时间：2020-11-17 16:00-17:00，课程名：狗狗与小鸟"];
            [model setDate:@"刚刚"];
            [_itemArray addObject:model];
        }
        
        for (int i = 0; i < 3; i++)
        {
            ZSKJNoticeModel *model = [[ZSKJNoticeModel alloc]init];
            [model setType:UnreadNoticeType];
            [model setTitle:@"请假通知"];
            [model setContent:@"张明明请假，课程时间：2020-11-17 16:00-17:00，课程名：狗狗与小鸟"];
            [model setDate:@"2020-11-18 13:56"];
            [_itemArray addObject:model];
        }
    }
    return _itemArray;
}






@end
