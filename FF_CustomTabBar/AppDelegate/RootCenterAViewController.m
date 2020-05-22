//
//  RootCenterAViewController.m
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/22.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import "RootCenterAViewController.h"

#import "HomeViewController.h"
#import "FilesViewController.h"
#import "MyViewController.h"

#import "NextViewCenterAController.h"

@interface RootCenterAViewController ()<UITabBarControllerDelegate>

@end

@implementation RootCenterAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    
    [self customTabBar_centerA];
    
    
}

-(void)customTabBar_centerA{

    /**
        关于中间拍照图片顶部没有白色边框的问题：
        可以让UI切图的时候带上一圈白色边框即可
     */
    
    // 不透明
    [UITabBar appearance].translucent = NO;
       
    // 去掉黑线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    
    HomeViewController *home = [HomeViewController new];
    FilesViewController *file = [FilesViewController new];
    MyViewController *my = [MyViewController new];
    
    NSArray *array = @[home,file,my];
    NSArray *titles = @[@"首页",@"",@"我的"];
    NSArray *images = @[@"tabBar_01",@"tabBar_center",@"tabBar_03"];
    NSArray *images_s = @[@"tabBar_01_selected",@"tabBar_center",@"tabBar_03_selected"];
    
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (int i = 0; i < titles.count; i++) {
        UIViewController *vc = array[i];
        
        UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
           
        UIImage *normalImage = [[UIImage imageNamed:images[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selectedImage = [[UIImage imageNamed:images_s[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
          
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:titles[i] image:normalImage selectedImage:selectedImage];
        if (i == 1) {
            // 设置中间凸起图片偏移量
            tabBarItem.imageInsets = UIEdgeInsetsMake(-8.0, 0, 8.0, 0);

        }else{
            tabBarItem.imageInsets = UIEdgeInsetsMake(-1.0, 0, 1.0, 0);
            tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -1.0);
        }
        
        [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor]} forState:UIControlStateNormal];
        [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : kMainColor} forState:UIControlStateSelected];
           
        nvc.tabBarItem = tabBarItem;
        
        [viewControllers addObject:nvc];
    }
    
    self.viewControllers = viewControllers;

}


-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    NSInteger index = [self.tabBar.items indexOfObject:item];
    if (index == 1) {
        self.tabBar.hidden = YES;
    }else{
        self.tabBar.hidden = NO;
        // 中间的不做动画了
        [self animationWithDidSelectItem:item];
    }
}

- (void)animationWithDidSelectItem:(UITabBarItem *)item{
    
    NSInteger index = [self.tabBar.items indexOfObject:item];

    NSMutableArray *btnArray = [NSMutableArray array];
    
    for (UIView *barView in self.tabBar.subviews) {
       if ([barView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
           [btnArray addObject:barView];
       }
    }
    
    // 给这个btnView添加动画 图片和文字都会动
    UIView *btnView = [btnArray objectAtIndex:index];

    // 只给图标添加动画
    for (UIImageView *btnImageView in btnView.subviews) {
        
       if ([btnImageView isKindOfClass:[UIImageView class]]) {
           
           [FFTabBarAnimation locationPointAnimationWithAnimationView:btnImageView];
           
//           [UIView animateWithDuration:0.15 animations:^{
//               btnImageView.transform = CGAffineTransformMakeScale(0.7, 0.7);
//
//           } completion:^(BOOL finished) {
//               [UIView animateWithDuration:0.15 animations:^{
//                   btnImageView.transform = CGAffineTransformIdentity;
//               }];
//
//           }];
       }
    }
}


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    if (index == 1) {
        NextViewCenterAController *vc = [NextViewCenterAController new];
//        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [viewController presentViewController:vc animated:NO completion:^{
            
        }];
        
        __weak typeof(self) weakSelf = self;
        vc.dismissBlock = ^(NextViewCenterAController * _Nonnull nextVC) {
            weakSelf.tabBar.hidden = NO;
        };
    }
    
    
    
    return YES;
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    
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
