//
//  ZSKJExhibitionControl.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/30.
//

#define MaxSections 50


#import "ZSKJExhibitionControl.h"



@interface ZSKJExhibitionControl () <UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic, assign) NSInteger height;
@property (nonatomic, strong) NSTimer *timer;


@end

@implementation ZSKJExhibitionControl


- (instancetype)initWithFrame:(CGRect)frame withType:(FlowLayoutType)type
{
    self = [super initWithFrame:frame withType:type];
    if (self)
    {
        [self setDelegate:self];
        [self setDataSource:self];
        [self setShowsHorizontalScrollIndicator:NO];
        [self setPagingEnabled:YES];
        [self registerClass:[ZSKJExhibitionCollectionViewCell class] forCellWithReuseIdentifier:@"ZSKJExhibitionCollectionViewCell"];
        
        [self setHeight:frame.size.height];
    }
    return self;
}


-(void)setItemsArray:(NSArray *)itemsArray
{
    [self.itemArry setArray:itemsArray];
    [self reloadData];
    [self addTimer];
}




#pragma mark - Deletage Method
#pragma mark - Deletage Method
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return MaxSections;
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.itemArry count];
}





- (ZSKJExhibitionCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZSKJExhibitionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZSKJExhibitionCollectionViewCell" forIndexPath:indexPath];
    [cell setModel:[self.itemArry objectAtIndex:indexPath.row]];
    return cell;
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}


#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenWidth, self.height);
}



- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}




#pragma mark - Private Method
- (void)addTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(nextPage) userInfo:NULL repeats:YES];
}
 
// 定时器的内容
- (void)nextPage
{
    // 获取当前的 indexPath
    NSIndexPath *currentIndexPath = [[self indexPathsForVisibleItems] lastObject];
    NSIndexPath *currentIndexPathSet = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:((MaxSections >= 2 ? MaxSections : 2) / 2)];
    
    
    
    
    [self scrollToItemAtIndexPath:currentIndexPathSet atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    // 设置下一个滚动的item的indexPath
    NSInteger nextItem = currentIndexPathSet.item + 1;
    NSInteger nextSection = currentIndexPathSet.section;
    
    
    if (nextItem == self.itemArry.count)
    {
        // 当item等于轮播图的总个数的时候
        // item等于0, 分区加1
        // 未达到的时候永远在50分区中
        nextItem = 0;
        nextSection ++;
        if (nextSection >= MaxSections)
        {
            nextSection = 0;
        }
    }
    // NSLog(@"----%ld---%ld", nextItem, nextSection);
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    [self scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
}
 
#pragma mark ----ScrollView 代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 添加定时器
    [self addTimer];
}
 
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 移除定时器
    [self.timer invalidate];
    self.timer = nil;
}






@end
