//
//  RootCenterBViewController.m
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/22.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import "RootCenterBViewController.h"

#import "HomeViewController.h"
#import "MyViewController.h"

#import "FFCenterBTabBar.h"

#import "NextCenterBViewController.h"


@interface RootCenterBViewController ()<UITabBarControllerDelegate>

@end

@implementation RootCenterBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.delegate = self;
    
    
    [self customTabBar_centerB];
 
}

-(void)customTabBar_centerB{

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
    MyViewController *my = [MyViewController new];
    
    NSArray *array = @[home,my];
    NSArray *titles = @[@"首页",@"我的"];
    NSArray *images = @[@"tabBar_01",@"tabBar_03"];
    NSArray *images_s = @[@"tabBar_01_selected",@"tabBar_03_selected"];
    
    for (int i = 0; i < titles.count; i++) {
        UIViewController *vc = array[i];
        
        UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
           
        UIImage *normalImage = [[UIImage imageNamed:images[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selectedImage = [[UIImage imageNamed:images_s[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
          
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:titles[i] image:normalImage selectedImage:selectedImage];
        tabBarItem.imageInsets = UIEdgeInsetsMake(-1.0, 0, 1.0, 0);
        tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -1.0);
       
        [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor]} forState:UIControlStateNormal];
        [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : kMainColor} forState:UIControlStateSelected];
           
        nvc.tabBarItem = tabBarItem;
        
        // 这里要用添加子控制器的方式添加 不能用viewControllers属性来设置（默认应该选中第一个栏目，结果没有选中）
        [self addChildViewController:nvc];
    }
    
    
    // 利用KVC更换只读的系统tabBar
    FFCenterBTabBar *tabBar = [[FFCenterBTabBar alloc] init];
       [self setValue:tabBar forKeyPath:@"tabBar"];

    __weak typeof(self) weakSelf = self;
    tabBar.tabBarCenterButtonActionBlock = ^(FFCenterBTabBar * _Nonnull bTabBar, UIButton * _Nonnull sender) {
        NSLog(@"---- center btn item -- ");
        
        // present一个导航控制器（类似唱吧APP）
        NextCenterBViewController *vc = [NextCenterBViewController new];
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
        nc.modalPresentationStyle = UIModalPresentationFullScreen;

        [weakSelf presentViewController:nc animated:YES completion:^{

        }];

        vc.dismissBlock = ^(NextCenterBViewController * _Nonnull nextVC) {


        };
  
    };
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
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
               
               //[FFTabBarAnimation scaleAnimationWithAnimationView:btnImageView];
               
               [UIView animateWithDuration:0.15 animations:^{
                   btnImageView.transform = CGAffineTransformMakeScale(0.7, 0.7);
    
               } completion:^(BOOL finished) {
                   [UIView animateWithDuration:0.15 animations:^{
                       btnImageView.transform = CGAffineTransformIdentity;
                   }];
    
               }];
           }
        }
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
