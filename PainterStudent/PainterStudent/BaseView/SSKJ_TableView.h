//
//  SSKJ_TableView.h
//  SSKJ
//
//  Created by 姚立志 on 2019/10/23.
//  Copyright © 2019 姚立志. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSKJ_TableViewCell.h"


typedef NS_ENUM(NSInteger,RefreshType)
{
    HeaderType = 1,
    FooterType = 2,
};


NS_ASSUME_NONNULL_BEGIN

@interface SSKJ_TableView : UITableView


@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) int page;



- (instancetype)initWitDeletage:(UIViewController*)delegate;




- (instancetype)initWithFrame:(CGRect)frame witDeletage:(UIViewController*)delegate;


/// 检测数据，显示空图标
/// @param array 数据源数组
-(void)setItemArray:(NSArray*)array;





/// 添加头部刷新

/// -(void)headerRefresh
/// @param target 代理对象
/// @param action 刷新方法
-(void)headerTarget:(id)target action:(SEL)action;

-(void)headerRefresh;


/// 添加脚部刷新
/// -(void)footerRefresh
/// @param target 代理对象
/// @param action 刷新方法
-(void)footerTarget:(id)target action:(SEL)action;

-(void)footerRefresh;

/// 没有更多数据
-(void)endNoMoreData;

//重置数据
-(void)resetNoMoreData;



/// 刷新完毕
-(void)endRefresh;


-(void)beginRefreshing;






@end




NS_ASSUME_NONNULL_END
