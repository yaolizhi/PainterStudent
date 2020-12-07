//
//  AppDelegate.m
//  PainterStudent
//
//  Created by 姚立志 on 2020/11/20.
//

#import "AppDelegate.h"
#import "ZSKJTabBarController.h"
#import "ZSKJLoginViewController.h"



@interface AppDelegate ()



@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self isLogin:YES];
    return YES;
}



-(void)isLogin:(BOOL)login
{
    if ([ZSKJUserinfoModel shareUserinfo].isLogin)
    {
        ZSKJTabBarController *tabBarVC = [[ZSKJTabBarController alloc]init];
        [self.window setRootViewController:tabBarVC];
    }
    else
    {
        ZSKJLoginViewController *loginVC = [[ZSKJLoginViewController alloc]init];
        [self.window setRootViewController:loginVC];
    }
}

@end
