//
//  ZSKJCollectionView.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/25.
//

#import "ZSKJCollectionView.h"

@interface ZSKJCollectionView ()

@property (nonatomic, strong) UIButton *iconView;


@end

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
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
        [self setBackgroundColor:KLineColor];
        
        [self addSubview:self.iconView];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY).offset(-60);
                    
            
        }];
    }
    return self;
}




- (instancetype)initWithType:(FlowLayoutType)type
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
    self = [super initWithFrame:CGRectZero collectionViewLayout:layouts];
    if (self)
    {
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
        [self setBackgroundColor:KLineColor];
        
        [self addSubview:self.iconView];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY).offset(-60);
                    
            
        }];
    }
    return self;
}


/// 根据数据内容是否显示空白内容
/// @param array 数组
-(void)setItemsArray:(NSArray*)array
{
    [self.iconView setHidden:[array count]];
}



#pragma mark - Public Method
#pragma mark 添加头部刷新
//-(void)headerRefresh
/// 添加头部刷新
/// @param target 代理对象
/// @param action 刷新方法
-(void)headerTarget:(id)target action:(SEL)action
{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
}

#pragma mark 添加脚部刷新
//-(void)footerRefresh
/// 添加脚部刷新
/// @param target 代理对象
/// @param action 刷新方法
-(void)footerTarget:(id)target action:(SEL)action
{
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
    [self.mj_footer setAutomaticallyHidden:YES];
}


#pragma mark 没有更多数据
/// 没有更多数据
-(void)endNoMoreData
{
    [self endRefresh];
    [self.mj_footer endRefreshingWithNoMoreData];
    [self.mj_footer setAutomaticallyHidden:YES];
}

#pragma mark 重置数据
-(void)resetNoMoreData
{
    [self endRefresh];
    [self.mj_footer resetNoMoreData];
}


#pragma mark 刷新完毕
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


#pragma mark 进入刷新状态
-(void)beginRefreshing
{
    [self.mj_header beginRefreshing];
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



@end



/**
 
 
 #pragma mark - Deletage Method
 - (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
 {
     return 1;
 }




 - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
 {
     return 100;
 }



 - (ZSKJMineResumeCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
 {
     ZSKJMineResumeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZSKJMineResumeCollectionViewCell" forIndexPath:indexPath];
     
     return cell;
 }

 - (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
 {
     
     
 }


 #pragma mark UICollectionViewDelegateFlowLayout
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
 {
     return CGSizeMake((ScreenWidth-120)/3.0, 150);
 }

 - (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
 {
     return UIEdgeInsetsMake(0, 15.0, 15.0, 15.0);
 }

 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
 {
     return 7.5;
 }

 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
 {
     return 7.5;
 }

 
 
 */
