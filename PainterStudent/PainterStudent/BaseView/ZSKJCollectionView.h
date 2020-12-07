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

@property (nonatomic, assign) int page; //!< 分页数量

@property (nonatomic, strong) NSMutableArray *itemArry;


- (instancetype)initWithFrame:(CGRect)frame withType:(FlowLayoutType)type;

- (instancetype)initWithType:(FlowLayoutType)type;





#pragma mark 添加头部刷新
/// 添加头部刷新
/// @param target 代理对象
/// @param action 刷新方法
-(void)headerTarget:(id)target action:(SEL)action;

#pragma mark 添加脚部刷新
/// 添加脚部刷新
/// @param target 代理对象
/// @param action 刷新方法
-(void)footerTarget:(id)target action:(SEL)action;

#pragma mark 没有更多数据
/// 没有更多数据
-(void)endNoMoreData;

#pragma mark 重置数据
//重置数据
-(void)resetNoMoreData;



#pragma mark 刷新完毕
/// 刷新完毕
-(void)endRefresh;


#pragma mark 进入刷新状态
-(void)beginRefreshing;


/// 根据数据内容是否显示空白内容
/// @param array 数组
-(void)setItemsArray:(NSArray*)array;

@end

NS_ASSUME_NONNULL_END
