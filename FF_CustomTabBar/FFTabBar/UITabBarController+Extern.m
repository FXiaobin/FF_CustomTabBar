//
//  UITabBarController+Extern.m
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/21.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import "UITabBarController+Extern.h"

@implementation UITabBarController (Extern)


-(void)createTabBarControllerWithViewControllers:(NSArray *)viewControllers titles:(NSArray *)titles normalImages:(NSArray *)normalImages selectedImages:(NSArray *)selectedImages{
    
    if (viewControllers.count == 0) {
        return;
    }
    
    [UITabBar appearance].translucent = NO;
    //移除顶部线条
    //[UITabBar appearance].shadowImage = [UIImage new];
    //[UITabBar appearance].backgroundImage = [UIImage new];
    
    /*
    for (int i = 0; i < viewControllers.count; i++) {
        UIViewController *viewcontroller = viewControllers[i];
        NSString *title = titles[i];
        NSString *normalImage = normalImages[i];
        NSString *selectedImage = selectedImages[i];
        
        [self setupChildVC:viewcontroller title:title andNormalImage:normalImage andSelectImage:selectedImage];
    }
    
     */
    
    NSMutableArray *navigationControllers = [NSMutableArray array];
    for (int i = 0; i < viewControllers.count; i++) {
        UIViewController *viewcontroller = viewControllers[i];
        NSString *title = titles[i];
        NSString *normalImage = normalImages[i];
        NSString *selectedImage = selectedImages[i];
        
        UINavigationController *nc = [self childNavigationControllerWithRootVC:viewcontroller title:title andNormalImage:normalImage andSelectImage:selectedImage];
        
        [navigationControllers addObject:nc];
    }
    
    self.viewControllers = navigationControllers;
}

/**
 * 初始化子控制器
 */
- (void)setupChildVC:(UIViewController *)vc title:(NSString *)title andNormalImage:(NSString * )image andSelectImage:(NSString *)selImage{
    
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    
    UIImage *normalImage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:selImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:selectedImage];
    tabBarItem.imageInsets = UIEdgeInsetsMake(-2.0, 0, 2.0, 0);
    tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2.0);
 
    nvc.tabBarItem = tabBarItem;
    
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor]} forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : kMainColor} forState:UIControlStateSelected];
    
    [self addChildViewController:nvc];
}

- (UINavigationController *)childNavigationControllerWithRootVC:(UIViewController *)vc title:(NSString *)title andNormalImage:(NSString * )image andSelectImage:(NSString *)selImage{
    
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    
    UIImage *normalImage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:selImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
   
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:selectedImage];
    tabBarItem.imageInsets = UIEdgeInsetsMake(-2.0, 0, 2.0, 0);
    tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2.0);
 
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor]} forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : kMainColor} forState:UIControlStateSelected];
    
    nvc.tabBarItem = tabBarItem;
    
    return nvc;
}

@end
