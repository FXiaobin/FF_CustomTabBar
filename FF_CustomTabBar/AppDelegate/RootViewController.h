//
//  RootViewController.h
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/21.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RootViewController : UITabBarController

/** 切换到第几个模块 */
@property (nonatomic,assign) NSInteger switchIndex;

@end

NS_ASSUME_NONNULL_END
