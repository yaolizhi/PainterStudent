//
//  ZSKJBaseViewController.m
//  PainterTeacher
//
//  Created by 姚立志 on 2020/11/20.
//

#import "ZSKJBaseViewController.h"

@interface ZSKJBaseViewController ()

@end



@implementation ZSKJBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addSubVies:YES];
    [self.view setBackgroundColor:KLineColor];
    if (self.navigationController.viewControllers.count > 1)
    {
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageWithOriginalName:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnAction:)];
        [self.navigationItem setLeftBarButtonItem:item];
        
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}




-(void)addSubVies:(BOOL)views
{
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self.tabBarController.tabBar setHidden:YES];
    [self.navigationController pushViewController:viewController animated:animated];
}


-(void)viewWillAppear:(BOOL)animated bottomBar:(BOOL)hidden
{
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:hidden];
}


/*
 * 修改导航栏左侧按钮
 */
- (void)addLeftNavItemWithImage:(UIImage*)image
{
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnAction:)];
    [self.navigationItem setLeftBarButtonItem:item];
}


/*
 * 修改导航栏左侧按钮
 */
- (void)addLeftNavItemWithTitle:(NSString*)title
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnAction:)];
    [self.navigationItem setLeftBarButtonItem:item];
}



/*
 * 返回按钮点击事件
 */
- (void)leftBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



/*
 * 添加导航栏右侧按钮
 */
- (void)addRightNavItemWithTitle:(NSString*)title
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(rigthBtnAction:)];
    [self.navigationItem setRightBarButtonItem:item];
    
}



/*
 * 添加导航栏右侧按钮
 */
- (void)addRightNavgationItemWithImage:(UIImage*)image
{
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(rigthBtnAction:)];
    [self.navigationItem setRightBarButtonItem:item];
}


/*
 * 导航栏右侧按钮点击事件
 */
- (void)rigthBtnAction:(id)sender
{
    
    
    
}
/*
 * 导航栏右侧按钮点击事件
 */
-(void)setNavigationBarHidden:(BOOL)isHidden
{
    [self.navigationController setNavigationBarHidden:isHidden];
}


/**
 设置tabar的item的未中图片
 */
-(void)setTabBarItemImage:(NSString*)imageName
{
    [self.tabBarItem setImage:[UIImage imageWithOriginalName:imageName]];
}

/**
 设置tabar的item的选中图片
 */
-(void)setTabBarItemSelectedImage:(NSString*)imageName
{
    [self.tabBarItem setSelectedImage:[UIImage imageWithOriginalName:imageName]];
}

/**
 设置tabar的item的标题
 */
-(void)setTabBarItemTitle:(NSString*)title
{
    [self.tabBarItem setTitle:title];
    [self setTitle:title];
}



-(float)statusbarHeight
{
    //状态栏高度
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}




-(float)navbarHeight
{
    //导航栏高度+状态栏高度
    return (self.navigationController.navigationBar.frame.size.height) + ([UIApplication sharedApplication].statusBarFrame.size.height);
}


-(float)tabbarHeight
{
    //Tabbar高度
    return self.tabBarController.tabBar.bounds.size.height;
}




@end
