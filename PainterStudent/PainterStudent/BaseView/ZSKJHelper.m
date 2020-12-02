//
//  ZSKJHelper.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/24.
//

#import "ZSKJHelper.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ZSKJHelper ()

@property (nonatomic, copy) NSString *temporaryDirectory; //!< 存放沙盒目录

@end


@implementation ZSKJHelper





static ZSKJHelper *shareHelper = nil;

+(ZSKJHelper *)shareHelper
{
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken,
        ^{
            shareHelper = [[self alloc] init];
            [shareHelper setTemporaryDirectory:NSTemporaryDirectory()];
        });
  
    return shareHelper;
}







+(void)pushViewController:(UIViewController*)object animated:(BOOL)animated
{
    [[ZSKJHelper root].tabBarController.tabBar setHidden:YES];
    [[ZSKJHelper root].navigationController pushViewController:object animated:animated];
}



// 获取当前显示的 UIViewController
+ (UIViewController *)root
{
    //获得当前活动窗口的根视图
    UIViewController *vc = AppWindow.rootViewController;
    UIViewController *currentShowingVC = [self findCurrentShowingViewControllerFrom:vc];
    return currentShowingVC;
}
+ (UIViewController *)findCurrentShowingViewControllerFrom:(UIViewController *)vc
{
    // 递归方法 Recursive method
    UIViewController *currentShowingVC;
    if ([vc presentedViewController]) {
        // 当前视图是被presented出来的
        UIViewController *nextRootVC = [vc presentedViewController];
        currentShowingVC = [self findCurrentShowingViewControllerFrom:nextRootVC];
 
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        UIViewController *nextRootVC = [(UITabBarController *)vc selectedViewController];
        currentShowingVC = [self findCurrentShowingViewControllerFrom:nextRootVC];
 
    } else if ([vc isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        UIViewController *nextRootVC = [(UINavigationController *)vc visibleViewController];
        currentShowingVC = [self findCurrentShowingViewControllerFrom:nextRootVC];
 
    } else {
        // 根视图为非导航类
        currentShowingVC = vc;
    }
 
    return currentShowingVC;
}

@end
