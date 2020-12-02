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


#pragma mark - Deletage Method
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (ZSKJHomeViewTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZSKJHomeViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZSKJHomeViewTableViewCell"];
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
    }
    return _tableView;
}

@end
