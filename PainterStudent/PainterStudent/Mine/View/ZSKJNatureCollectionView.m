//
//  ZSKJNatureCollectionView.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/12/3.
//

#import "ZSKJNatureCollectionView.h"
#import "ZSKJNatureCollectionViewCell.h"


@implementation ZSKJNatureCollectionView



- (instancetype)initWithType:(FlowLayoutType)type
{
    self = [super initWithType:type];
    if (self)
    {
        
        [self setBackgroundColor:KWhiteColor];
        [self setDelegate:self];
        [self setDataSource:self];
        [self registerClass:[ZSKJNatureCollectionViewCell class] forCellWithReuseIdentifier:@"ZSKJNatureCollectionViewCell"];
        
        
        
    }
    return self;
}


-(void)setItemObjectArry:(NSArray *)itemArry
{
    [self.itemArry setArray:itemArry];
    [self reloadData];
}







#pragma mark - Deletage Method
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.itemArry count];
}





- (ZSKJNatureCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZSKJNatureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZSKJNatureCollectionViewCell" forIndexPath:indexPath];
    [cell setTitle:[self.itemArry objectAtIndex:indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}


#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(120, 40);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 15.0, 0, 15.0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}



@end
