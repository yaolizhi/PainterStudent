//
//  ZSKJCollectionView.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/25.
//

#import "ZSKJCollectionView.h"

@implementation ZSKJCollectionView

- (instancetype)initWithFrame:(CGRect)frame withType:(FlowLayoutType)type
{
    UICollectionViewFlowLayout *layouts = [[UICollectionViewFlowLayout alloc] init];
    
    switch (type)
    {
        case VerticalType:
        {
            [layouts setScrollDirection:UICollectionViewScrollDirectionVertical];
        }
            break;
        case HorizontalType:
        {
            [layouts setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        }
            break;
    }
    self = [super initWithFrame:frame collectionViewLayout:layouts];
    if (self)
    {
        [self setBackgroundColor:KLineColor];
    }
    return self;
}



#pragma mark - Public Method
//-(void)headerRefresh
/// 添加头部刷新
/// @param target 代理对象
/// @param action 刷新方法
-(void)headerTarget:(id)target action:(SEL)action
{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
}

//-(void)footerRefresh
/// 添加脚部刷新
/// @param target 代理对象
/// @param action 刷新方法
-(void)footerTarget:(id)target action:(SEL)action
{
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
}


/// 没有更多数据
-(void)endNoMoreData
{
    [self.mj_footer endRefreshingWithNoMoreData];
}

//重置数据
-(void)resetNoMoreData
{
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
}



#pragma mark - Getter / Setter
-(NSMutableArray *)itemArry
{
    if (!_itemArry)
    {
        _itemArry = [NSMutableArray array];
    }
    return _itemArry;
}



@end
