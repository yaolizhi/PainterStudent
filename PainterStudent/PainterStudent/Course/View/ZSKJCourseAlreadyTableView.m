//
//  ZSKJCourseAlreadyTableView.m
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/2.
//

#import "ZSKJCourseAlreadyTableView.h"


@interface ZSKJCourseAlreadyTableView () <UITableViewDelegate,UITableViewDataSource>

@end


@implementation ZSKJCourseAlreadyTableView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setDelegate:self];
        [self setDataSource:self];
        [self registerClass:[ZSKJCourseTableViewCell class] forCellReuseIdentifier:@"ZSKJCourseTableViewCell"];
        
        [self headerTarget:self action:@selector(headerRefresh)];
        [self footerTarget:self action:@selector(footerRefresh)];
        
        
        
        
    }
    return self;
}



#pragma mark - Private Method
-(void)headerRefresh
{
    [self setPage:1];
    NSDictionary *parameters = @{@"token":[ZSKJUserinfoModel shareUserinfo].token,
                                 @"status":@"2",
                                 @"limit":@"10",
                                 @"page":[NSString stringWithFormat:@"%d",self.page]};
    [self getSchedule:parameters wityType:HeaderType];
}

-(void)footerRefresh
{
    NSDictionary *parameters = @{@"token":[ZSKJUserinfoModel shareUserinfo].token,
                                 @"status":@"2",
                                 @"limit":@"10",
                                 @"page":[NSString stringWithFormat:@"%d",self.page]};
    [self getSchedule:parameters wityType:FooterType];
}



#pragma mark - NetWork Method 网络请求
-(void)getSchedule:(NSDictionary*)parameters wityType:(RefreshType)type
{
    WS(weakSelf);
    [[ZSKJAFHTTPManager shareManager] postUrl:MySchedule_URL parameters:parameters success:^(id  _Nonnull responseObject) {
        
        ZSKJNetworkModel *netWorkModel = [ZSKJNetworkModel mj_objectWithKeyValues:responseObject];
        if (netWorkModel.code.integerValue == 1)
        {
            NSArray *array = [ZSKJCourseModel mj_objectArrayWithKeyValuesArray:[netWorkModel.data objectForKey:@"rows"]];
            
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
            
            if ([array count] >= PageSize)
            {
                [self setPage:self.page+1];
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

- (ZSKJCourseTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZSKJCourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZSKJCourseTableViewCell"];
    [cell setModel:[self.dataArray objectAtIndex:indexPath.row]];
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


@end
