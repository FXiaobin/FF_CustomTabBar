//
//  UITabBarController+Extern.h
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/21.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarController (Extern)

-(void)createTabBarControllerWithViewControllers:(NSArray *)viewControllers titles:(NSArray *)titles normalImages:(NSArray *)normalImages selectedImages:(NSArray *)selectedImages;


@end

NS_ASSUME_NONNULL_END
