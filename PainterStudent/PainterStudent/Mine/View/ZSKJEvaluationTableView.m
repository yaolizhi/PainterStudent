//
//  ZSKJEvaluationTableView.m
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/5.
//

#import "ZSKJEvaluationTableView.h"



@implementation ZSKJEvaluationTableView


- (instancetype)initWithFrame:(CGRect)frame witDeletage:(UIViewController *)delegate
{
    self = [super initWithFrame:frame witDeletage:delegate];
    if (self)
    {
        [self setDelegate:self];
        [self setDataSource:self];
        [self registerClass:[ZSKJEvaluationTableViewCell class] forCellReuseIdentifier:@"ZSKJEvaluationTableViewCell"];
        
        [self headerTarget:self action:@selector(headerRefresh)];
        [self footerTarget:self action:@selector(footerRefresh)];
        
    }
    return self;
}

- (void)setType:(InitType)type
{
    _type = type;
    [self beginRefreshing];
}


#pragma mark - Private Method
-(void)headerRefresh
{
    [self setPage:1];
    [self getReportWithType:HeaderType];
    
}


-(void)footerRefresh
{
    [self getReportWithType:FooterType];
}


#pragma mark - NetWork Method 网络请求
-(void)getReportWithType:(RefreshType)type
{
    NSDictionary *parameters = @{@"token":[ZSKJUserinfoModel shareUserinfo].token,@"type":[NSString stringWithFormat:@"%d",(int)self.type],@"limit":@"10",@"page":[NSString stringWithFormat:@"%d",self.page]};
    
    WS(weakSelf);
    [[ZSKJAFHTTPManager shareManager] postUrl:MyReport_URL parameters:parameters success:^(id  _Nonnull responseObject) {
        
        ZSKJNetworkModel *netWorkModel = [ZSKJNetworkModel mj_objectWithKeyValues:responseObject];
        if (netWorkModel.code.integerValue == 1)
        {
            NSArray *array = [ZSKJEvaluationModel mj_objectArrayWithKeyValuesArray:[netWorkModel.data objectForKey:@"rows"]];
            
            switch (type)
            {
                case HeaderType:
                {
                    [self.dataArray setArray:array];
                }
                    break;
                case FooterType:
                {
                    [self.dataArray addObjectsFromArray:array];
                }
                    break;
            }
            
            
            if ([array count] >= 10)
            {
                [self setPage:self.page+1];
                [self endRefresh];
            }
            else
            {
                [self endNoMoreData];
            }
        }
        else
        {
            [self endNoMoreData];
        }
    } failure:^(NSError * _Nonnull error) {
    
        [weakSelf endNoMoreData];
    
    }];
    
    
    
    
    
    
}

















#pragma mark - Deletage Method
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(SSKJ_TableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [tableView setItemArray:self.dataArray];
    return [self.dataArray count];
}


- (ZSKJEvaluationTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZSKJEvaluationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZSKJEvaluationTableViewCell"];
    [cell setModel:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}



#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 220;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}







@end
