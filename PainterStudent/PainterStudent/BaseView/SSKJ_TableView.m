//
//  SSKJ_TableView.m
//  SSKJ
//
//  Created by 姚立志 on 2019/10/23.
//  Copyright © 2019 姚立志. All rights reserved.
//

#import "SSKJ_TableView.h"

@interface SSKJ_TableView ()

@property (nonatomic, strong) UIButton *iconView;



@end

@implementation SSKJ_TableView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor:KLineColor];
        [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        
        [self setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        [self setEstimatedRowHeight:0];
        [self setEstimatedSectionHeaderHeight:0];
        [self setEstimatedSectionFooterHeight:0];
        
        [self addSubview:self.iconView];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY).offset(-60);
                    
            
        }];
    }
    return self;
}


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setPage:1];
        [self setBackgroundColor:KLineColor];
        [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        
        [self setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        [self setEstimatedRowHeight:0];
        [self setEstimatedSectionHeaderHeight:0];
        [self setEstimatedSectionFooterHeight:0];
        
        [self addSubview:self.iconView];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY).offset(-60);
                    
            
        }];
    }
    return self;
}


- (instancetype)initWitDeletage:(UIViewController*)delegate
{
    self = [super init];
    if (self)
    {
        [self setPage:1];
        [self setDelegate:(id)delegate];
        [self setDataSource:(id)delegate];
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        
        [self setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        [self setEstimatedRowHeight:0];
        [self setEstimatedSectionHeaderHeight:0];
        [self setEstimatedSectionFooterHeight:0];
        
        [self addSubview:self.iconView];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY).offset(-60);
                    
            
        }];
    }
    return self;
}




- (instancetype)initWithFrame:(CGRect)frame witDeletage:(UIViewController*)delegate
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setPage:1];
        [self setDelegate:(id)delegate];
        [self  setDataSource:(id)delegate];
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        
        [self setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        [self setEstimatedRowHeight:0];
        [self setEstimatedSectionHeaderHeight:0];
        [self setEstimatedSectionFooterHeight:0];
        
        
        [self addSubview:self.iconView];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY);
                    
        }];
    }
    return self;
}






#pragma mark - Public Method
/// 添加头部刷新
/// -(void)headerRefresh
/// @param target 代理对象
/// @param action 刷新方法
-(void)headerTarget:(id)target action:(SEL)action
{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
}

-(void)headerRefresh
{
    
}

/// 添加脚部刷新
/// -(void)footerRefresh
/// @param target 代理对象
/// @param action 刷新方法
-(void)footerTarget:(id)target action:(SEL)action
{
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
    [self.mj_footer setAutomaticallyHidden:YES];
}

-(void)footerRefresh
{
    
}


/// 没有更多数据
-(void)endNoMoreData
{
    [self endRefresh];
    [self.mj_footer endRefreshingWithNoMoreData];
}

//重置数据
-(void)resetNoMoreData
{
    [self endRefresh];
    [self.mj_footer resetNoMoreData];
}

-(void)endRefresh
{
    if (self.mj_header.state == MJRefreshStateRefreshing)
    {
        [self.mj_header endRefreshing];
    }
    
    if (self.mj_footer.state == MJRefreshStateRefreshing)
    {
        [self.mj_footer endRefreshing];
    }
    [self reloadData];
}



-(void)beginRefreshing
{
    [self.mj_header beginRefreshing];
}





#pragma mark - Getter / Setter
-(UIButton *)iconView
{
    if (!_iconView)
    {
        _iconView = [[UIButton alloc]init];
        [_iconView setImage:imageName(@"noticeEmpty") forState:UIControlStateNormal];
        [_iconView setHidden:YES];
        [_iconView addTarget:self action:@selector(beginRefreshing) forControlEvents:UIControlEventTouchUpInside];
    }
    return _iconView;
}


/// 检测数据，显示空图标
/// @param array 数据源数组
-(void)setItemArray:(NSArray*)array
{
    [self.iconView setHidden:(BOOL)[array count]];
}


-(NSMutableArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}







@end
