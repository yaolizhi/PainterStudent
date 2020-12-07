//
//  ZSKJNatureCollectionView.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/12/3.
//

#pragma mark 性格特点



#import "ZSKJCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZSKJNatureCollectionView : ZSKJCollectionView <UICollectionViewDataSource,UICollectionViewDelegate>


-(void)setItemObjectArry:(NSArray *)itemArry;



@end

NS_ASSUME_NONNULL_END
