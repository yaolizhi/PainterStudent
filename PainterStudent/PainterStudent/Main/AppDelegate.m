//
//  AppDelegate.m
//  PainterStudent
//
//  Created by 姚立志 on 2020/11/20.
//

#import "AppDelegate.h"
#import "ZSKJTabBarController.h"

@interface AppDelegate ()



@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    ZSKJTabBarController *launchVc = [[ZSKJTabBarController alloc]init];
    self.window.rootViewController = launchVc;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
