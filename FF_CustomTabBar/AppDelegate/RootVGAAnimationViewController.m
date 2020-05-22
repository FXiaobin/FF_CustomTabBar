//
//  RootVGAAnimationViewController.m
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/22.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import "RootVGAAnimationViewController.h"

#import "HomeViewController.h"
#import "FilesViewController.h"
#import "MyViewController.h"

#import "UITabBarController+Extern.h"

/**
 原理：
    选中状态时，将图标隐藏 ，添加一个UIView视图并在这个视图上绘制动画，其他未选中的图标显示出来
 
 */

@interface RootVGAAnimationViewController ()<UITabBarControllerDelegate>

@property (nonatomic,strong) UIView *currentView;


@end

@implementation RootVGAAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    [self systemTabBar];
    
    
    
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

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{

    NSInteger index = [self.tabBar.items indexOfObject:item];

    NSMutableArray *SwappableImageViews = [NSMutableArray array];

    for (UIControl *tabBarButton in self.tabBar.subviews) {
        
       if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
           
           for (UIImageView *imageView in tabBarButton.subviews) {
               
               if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]){
                   [SwappableImageViews addObject:imageView];
               }
           }
       }
    }

    for (int i = 0; i < SwappableImageViews.count; i++) {
        UIImageView *iv = SwappableImageViews[i];

        if (i == index) {
            iv.hidden = YES;

            if (index == 0) {
                [self pahts_home:iv];

            }else if (index == 1) {
                [self pahts_file:iv];

            }else if (index == 2) {
                [self pahts_my:iv];
            }

        }else{
            iv.hidden = NO;
        }
    }

}

-(void)tap:(UITapGestureRecognizer *)sender{
    NSInteger index = sender.view.tag - 10000;
    [self tabBar:self.tabBar didSelectItem:self.tabBar.items[index]];
}

-(void)pahts_home:(UIImageView *)imageView{
   
    if (self.currentView) {
        [self.currentView removeFromSuperview];
    }
    
    CGPoint center = imageView.center;
    self.currentView = [[UIView alloc] initWithFrame:CGRectMake(center.x - kTabBarItem_H / 2.0, center.y - kTabBarItem_H / 2.0, kTabBarItem_H, kTabBarItem_H)];
    self.currentView.tag = 10000;
    self.currentView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.currentView addGestureRecognizer:tap];
   
    [imageView.superview addSubview:self.currentView];
    
    [FFVGAAniamtion pahts_home:imageView contentView:self.currentView];
}

-(void)pahts_file:(UIImageView *)imageView{
  
    if (self.currentView) {
        [self.currentView removeFromSuperview];
    }
    
    CGPoint center = imageView.center;
    self.currentView = [[UIView alloc] initWithFrame:CGRectMake(center.x - kTabBarItem_H / 2.0, center.y - kTabBarItem_H / 2.0, kTabBarItem_H, kTabBarItem_H)];
    self.currentView.userInteractionEnabled = YES;
    self.currentView.tag = 10001;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.currentView addGestureRecognizer:tap];
    
    [imageView.superview addSubview:self.currentView];
    
    [FFVGAAniamtion pahts_file:imageView contentView:self.currentView];
}

-(void)pahts_my:(UIImageView *)imageView{
 
    if (self.currentView) {
        [self.currentView removeFromSuperview];
    }
    
    CGPoint center = imageView.center;
    self.currentView = [[UIView alloc] initWithFrame:CGRectMake(center.x - kTabBarItem_H / 2.0, center.y - kTabBarItem_H / 2.0, kTabBarItem_H, kTabBarItem_H)];
    self.currentView.userInteractionEnabled = YES;
    self.currentView.tag = 10002;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.currentView addGestureRecognizer:tap];
    [imageView.superview addSubview:self.currentView];
    
    [FFVGAAniamtion pahts_my:imageView contentView:self.currentView];
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
