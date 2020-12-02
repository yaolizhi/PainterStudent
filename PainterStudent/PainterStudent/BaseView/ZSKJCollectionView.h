//
//  ZSKJCollectionView.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/25.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,FlowLayoutType)
{
    VerticalType = 1, //!< 垂直
    HorizontalType = 2, //!< 水平
};



NS_ASSUME_NONNULL_BEGIN

@interface ZSKJCollectionView : UICollectionView


@property (nonatomic, strong) NSMutableArray *itemArry;


- (instancetype)initWithFrame:(CGRect)frame withType:(FlowLayoutType)type;




/// 添加头部刷新
/// @param target 代理对象
/// @param action 刷新方法
-(void)headerTarget:(id)target action:(SEL)action;

/// 添加脚部刷新
/// @param target 代理对象
/// @param action 刷新方法
-(void)footerTarget:(id)target action:(SEL)action;

/// 没有更多数据
-(void)endNoMoreData;

//重置数据
-(void)resetNoMoreData;



/// 刷新完毕
-(void)endRefresh;

@end

NS_ASSUME_NONNULL_END
