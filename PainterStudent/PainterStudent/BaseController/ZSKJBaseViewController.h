//
//  ZSKJBaseViewController.h
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/20.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"


NS_ASSUME_NONNULL_BEGIN

@interface ZSKJBaseViewController : UIViewController



-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
-(void)viewWillAppear:(BOOL)animated bottomBar:(BOOL)hidden;


/**
 添加子视图
 */
-(void)addSubVies:(BOOL)views;



/*
 * 修改导航栏左侧按钮
 */
- (void)addLeftNavItemWithImage:(UIImage*)image;

/*
 * 修改导航栏左侧按钮
 */
- (void)addLeftNavItemWithTitle:(NSString*)title;

/*
 * 返回按钮点击事件
 */
- (void)leftBtnAction:(id)sender;

/*
 * 添加导航栏右侧按钮
 */
- (void)addRightNavItemWithTitle:(NSString*)title;

/*
 * 添加导航栏右侧按钮
 */
- (void)addRightNavgationItemWithImage:(UIImage*)image;

/*
 * 导航栏右侧按钮点击事件
 */
- (void)rigthBtnAction:(id)sender;

/*
 * 导航栏是否隐藏
 */
-(void)setNavigationBarHidden:(BOOL)isHidden;


/**
 设置tabar的item的未中图片
 */
-(void)setTabBarItemImage:(NSString*)imageName;

/**
 设置tabar的item的选中图片
 */
-(void)setTabBarItemSelectedImage:(NSString*)imageName;


/**
 设置tabar的item的标题
 */
-(void)setTabBarItemTitle:(NSString*)title;


-(float)statusbarHeight;
-(float)navbarHeight;
-(float)tabbarHeight;


@end

NS_ASSUME_NONNULL_END
