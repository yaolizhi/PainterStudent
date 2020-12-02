//
//  ZSKJTabBarController.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/20.
//

#import "ZSKJTabBarController.h"
#import "ZSKJHomeViewController.h"
#import "ZSKJCourseViewController.h"
#import "ZSKJMineViewController.h"
#import "ZSKJNavigationViewController.h"
#import "ZSKJLoginViewController.h"





@interface ZSKJTabBarController () <UITabBarControllerDelegate>

@end

@implementation ZSKJTabBarController


/**
 *  当第一次使用这个类或者子类的时候调用，作用：初始化
 */
#pragma mark - 改变 tabbar 选中状态下的文字颜色
+ (void)initialize
{
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:KSubTextColor, NSForegroundColorAttributeName, [UIFont systemFontOfSize:12], NSFontAttributeName,nil] forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:KMainColor, NSForegroundColorAttributeName, [UIFont systemFontOfSize:12], NSFontAttributeName,nil] forState:UIControlStateSelected];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setDelegate:self];
    //添加home
    ZSKJHomeViewController *home = [[ZSKJHomeViewController alloc]init];
    ZSKJNavigationViewController *homeNav = [[ZSKJNavigationViewController alloc] initWithRootViewController:home];
    [home setTabBarItemImage:@"homeItemsNormal"];
    [home setTabBarItemSelectedImage:@"homeItems"];
    [home setTabBarItemTitle:@"首页"];
    [self addChildViewController:homeNav];
    
    
    //添加课程表
    ZSKJCourseViewController *course = [[ZSKJCourseViewController alloc]init];
    ZSKJNavigationViewController *courseNav = [[ZSKJNavigationViewController alloc] initWithRootViewController:course];
    [course setTabBarItemImage:@"courseItemsNormal"];
    [course setTabBarItemSelectedImage:@"courseItems"];
    [course setTabBarItemTitle:@"课表"];
    [self addChildViewController:courseNav];
    

    
    
    //添加我的
    ZSKJMineViewController *mine = [[ZSKJMineViewController alloc]init];
    ZSKJNavigationViewController *mineNav = [[ZSKJNavigationViewController alloc] initWithRootViewController:mine];
    [mine setTabBarItemImage:@"mineItemsNormal"];
    [mine setTabBarItemSelectedImage:@"mineItems"];
    [mine setTabBarItemTitle:@"我的"];
    [self addChildViewController:mineNav];
    

}



- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (tabBarController.selectedIndex == 3)
    {
        NSLog(@"点了我的");
    }
    else
    {
    }
}



@end
