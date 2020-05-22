//
//  RootViewController.m
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/21.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import "RootViewController.h"

#import "HomeViewController.h"
#import "FilesViewController.h"
#import "MyViewController.h"

#import "NextViewController.h"

#import "UITabBarController+Extern.h"

#import "FFATabBar.h"
#import "FFBTabBar.h"

@interface RootViewController ()<UITabBarControllerDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    
    //[self systemTabBar];
    
   // [self customTabBar_A];
    
    [self customTabBar_B];
    
    
    
}

-(void)systemTabBar{
   
    HomeViewController *home = [HomeViewController new];
    FilesViewController *file = [FilesViewController new];
    MyViewController *my = [MyViewController new];
    
    NSArray *array = @[home,file,my];
    NSArray *titles = @[@"首页",@"文件",@"我的"];
    NSArray *images = @[@"tabBar_01",@"tabBar_02",@"tabBar_03"];
    NSArray *images_s = @[@"tabBar_01_selected",@"tabBar_02_selected",@"tabBar_03_selected"];
   
    [self createTabBarControllerWithViewControllers:array titles:titles normalImages:images selectedImages:images_s];

}


- (void)customTabBar_A{
    
    HomeViewController *home = [HomeViewController new];
    FilesViewController *file = [FilesViewController new];
    MyViewController *my = [MyViewController new];
    
    UINavigationController *homeNC = [[UINavigationController alloc] initWithRootViewController:home];
    UINavigationController *fileNC = [[UINavigationController alloc] initWithRootViewController:file];
    UINavigationController *myNC = [[UINavigationController alloc] initWithRootViewController:my];
    
    NSArray *viewControllers = @[homeNC,fileNC,myNC];
    self.viewControllers = viewControllers;
    
    NSArray *titles = @[@"首页",@"文件",@"我的"];
    NSArray *images = @[@"tabBar_01",@"tabBar_02",@"tabBar_03"];
    NSArray *selctedImages = @[@"tabBar_01_selected",@"tabBar_02_selected",@"tabBar_03_selected"];
    
    // 通过kvc的方式 修改系统tabBar上面的按钮位置
    FFATabBar *tabBar = [[FFATabBar alloc] initWithTitles:titles images:images selctedImages:selctedImages];
    tabBar.isShowTopLine = YES;
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    //*
    //默认选择个人中心
    self.switchIndex = 2;
//*/
    
    __weak typeof(self) weakSelf = self;
    tabBar.tabBarButtonActionBlock = ^(FFATabBar * _Nonnull aTabBar, NSInteger index, UIButton *sender) {
        /*
        if (index == 2) {
            // 模拟未登录用户不能进入个人中心
            return;
        }
         */
        
        [FFTabBarAnimation shakeAnimationWithAnimationView:sender];
        
        // 切换自定义tabBar的选中索引
        aTabBar.selectedIndex = index;
        
        // 切换UITabBarController选中的控制器
        weakSelf.selectedIndex = index;
    };
    
}

-(void)setSwitchIndex:(NSInteger)switchIndex{
    _switchIndex = switchIndex;
    
    //
    //FFATabBar *tabBar = (FFATabBar *)self.tabBar;
    
    FFBTabBar *tabBar = (FFBTabBar *)self.tabBar;
    tabBar.selectedIndex = switchIndex;
    self.selectedIndex = switchIndex;
}


-(void)customTabBar_B{
    
    HomeViewController *home = [HomeViewController new];
    FilesViewController *file = [FilesViewController new];
    MyViewController *my = [MyViewController new];
    
    UINavigationController *homeNC = [[UINavigationController alloc] initWithRootViewController:home];
    UINavigationController *fileNC = [[UINavigationController alloc] initWithRootViewController:file];
    UINavigationController *myNC = [[UINavigationController alloc] initWithRootViewController:my];
    
    NSArray *viewControllers = @[homeNC,fileNC,myNC];
    self.viewControllers = viewControllers;
    
    NSArray *titles = @[@"首页",@"文件",@"我的"];
    NSArray *images = @[@"tabBar_01",@"tabBar_02",@"tabBar_03"];
    NSArray *selctedImages = @[@"tabBar_01_selected",@"tabBar_02_selected",@"tabBar_03_selected"];
    
    // 通过kvc的方式 修改系统tabBar上面的按钮位置
    FFBTabBar *tabBar = [[FFBTabBar alloc] initWithTitles:titles images:images selctedImages:selctedImages];
    tabBar.isHiddenTopLine = NO;
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    /*
    //默认选择个人中心
    self.switchIndex = 2;
     */
    
    __weak typeof(self) weakSelf = self;
    tabBar.tabBarButtonActionBlock = ^(FFBTabBar * _Nonnull aTabBar, NSInteger index, UIButton *sender) {
        /*
        if (index == 2) {
            // 模拟未登录用户不能进入个人中心
            return;
        }
         */
        
        UIImageView *imageV;
        for (UIView *suv in sender.subviews) {
            if ([suv isKindOfClass:[UIImageView class]]) {
                imageV = (UIImageView *)suv;
                break;
            }
        }
        
        // UIButton上的图片做动画
        [FFTabBarAnimation shakeAnimationWithAnimationView:imageV];
        
        // 整个UIButton都做动画
        //[FFTabBarAnimation shakeAnimationWithAnimationView:sender];
        
        // 切换自定义tabBar的选中索引
        aTabBar.selectedIndex = index;
        
        // 切换UITabBarController选中的控制器
        weakSelf.selectedIndex = index;
    };
    
    
}









/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
