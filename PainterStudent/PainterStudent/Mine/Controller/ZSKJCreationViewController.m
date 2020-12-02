//
//  ZSKJCreationViewController.m
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/2.
//

#import "ZSKJCreationViewController.h"
#import "ZSKJCreationCollectionViewCell.h"


@interface ZSKJCreationViewController () <UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic, strong) ZSKJCollectionView *creationCollectionView; //!< 我的作品



@end

@implementation ZSKJCreationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"我的作品"];
}


-(void)addSubVies:(BOOL)views
{
    if (views)
    {
        [self.view addSubview:self.creationCollectionView];
        
    }
}







#pragma mark - Deletage Method
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100; //[self.itemArray count]
}



- (ZSKJCreationCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZSKJCreationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZSKJCreationCollectionViewCell" forIndexPath:indexPath];
//    [cell setModel:[self.itemArry objectAtIndex:indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}


#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((ScreenWidth-60)/3.0, 175);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 15, 15, 15);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}





#pragma mark - Getter / Setter
-(ZSKJCollectionView *)creationCollectionView
{
    if (!_creationCollectionView)
    {
        _creationCollectionView = [[ZSKJCollectionView alloc]initWithFrame:CGRectMake(0, self.navbarHeight, ScreenWidth, ScreenHeight-self.navbarHeight) withType:VerticalType];
        [_creationCollectionView registerClass:[ZSKJCreationCollectionViewCell class] forCellWithReuseIdentifier:@"ZSKJCreationCollectionViewCell"];
        [_creationCollectionView setDelegate:self];
        [_creationCollectionView setDataSource:self];
    }
    return _creationCollectionView;
}







@end
