//
//  ZSKJHomeViewController.m
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/2.
//

#import "ZSKJHomeViewController.h"
#import "ZSKJHomeViewTableViewCell.h"
#import "ZSKJExhibitionControl.h"


@interface ZSKJHomeViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) SSKJ_TableView *tableView;


@property (nonatomic, strong) ZSKJExhibitionControl *topView;


@end

@implementation ZSKJHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self getNextSchedule];
}


- (void)addSubVies:(BOOL)views
{
    if (views)
    {
        [self.view addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(self.navbarHeight, 0, self.tabbarHeight, 0));
                    
        }];
        
        
        NSMutableArray *aray = [NSMutableArray array];
        for (int i = 0; i < 5; i++)
        {
            ZSKJExhibitionModel *model = [[ZSKJExhibitionModel alloc]init];
            [model setUrl:[NSString stringWithFormat:@"banner%d",i]];
            
            [aray addObject:model];
        }
        
        [self.topView setItemsArray:aray];
    }
}

#pragma mark - Private Method
-(void)headerRefresh
{
    [self getNextSchedule];
}


#pragma mark - NetWork Method 网络请求
#pragma mark 获取下次上课
-(void)getNextSchedule
{
    WS(weakSelf);
    NSDictionary *parameters = @{@"token":[ZSKJUserinfoModel shareUserinfo].token};
    [[ZSKJAFHTTPManager shareManager] postUrl:NextSchedule_URL parameters:parameters success:^(id  _Nonnull responseObject) {
        
        ZSKJNetworkModel *netWorkModel = [ZSKJNetworkModel mj_objectWithKeyValues:responseObject];
        if (netWorkModel.code.integerValue == 1)
        {
            ZSKJExhibitionModel *model = [ZSKJExhibitionModel mj_objectWithKeyValues:netWorkModel.data];
            [weakSelf.itemArray addObject:model];
        }
        
        [weakSelf.tableView endRefresh];
        
            
    } failure:^(NSError * _Nonnull error) {
        
        [weakSelf.tableView endRefresh];
    }];
}
















#pragma mark - Deletage Method
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(SSKJ_TableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [tableView setItemArray:self.itemArray];
    return [self.itemArray count];;
}



- (ZSKJHomeViewTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZSKJHomeViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZSKJHomeViewTableViewCell"];
    [cell setModel:[self.itemArray objectAtIndex:indexPath.row]];
    return cell;
}



#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 220;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



#pragma mark - Getter / Setter
- (ZSKJExhibitionControl *)topView
{
    if (!_topView)
    {
        _topView = [[ZSKJExhibitionControl alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 300) withType:HorizontalType];
        [_topView setBackgroundColor:[UIColor blueColor]];
    }
    return _topView;
}


-(SSKJ_TableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[SSKJ_TableView alloc]initWitDeletage:self];
        [_tableView registerClass:[ZSKJHomeViewTableViewCell class] forCellReuseIdentifier:@"ZSKJHomeViewTableViewCell"];
        [_tableView setTableHeaderView:self.topView];
        [_tableView headerTarget:self action:@selector(headerRefresh)];
    }
    return _tableView;
}



@end
