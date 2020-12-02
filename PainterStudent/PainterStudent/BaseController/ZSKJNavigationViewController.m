//
//  ZSKJNavigationViewController.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/20.
//

#import "ZSKJNavigationViewController.h"

@interface ZSKJNavigationViewController () <UINavigationControllerDelegate>

@end

@implementation ZSKJNavigationViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];


    [self setDelegate:self];
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        
        [self.interactivePopGestureRecognizer setDelegate:self];
    }
}


#pragma mark - 设置侧滑返回功能
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0 )
    {
        [viewController setHidesBottomBarWhenPushed:YES];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.viewControllers.count > 1;
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    //使navigationcontroller中第一个控制器不响应右滑pop手势
    if (navigationController.viewControllers.count == 1) {
        navigationController.interactivePopGestureRecognizer.enabled = NO;
        navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}


@end
