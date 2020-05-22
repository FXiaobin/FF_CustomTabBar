//
//  FFCenterBTabBar.h
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/22.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
   系统的UITabBar 通过重设UITabBarItem的frame来添加中间的UIButton
    中间UIButton不占用了UITabBarController的一个子控制器，只是让UITabBarController的子控制器所对应的UITabBarItem的位置重设了一下，
    给要添加的中间UIButton留个位置而已
*/


NS_ASSUME_NONNULL_BEGIN

@interface FFCenterBTabBar : UITabBar

@property (nonatomic,copy) void (^tabBarCenterButtonActionBlock) (FFCenterBTabBar *bTabBar,UIButton *sender);

@end

NS_ASSUME_NONNULL_END
