//
//  NextCenterBViewController.h
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/22.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NextCenterBViewController : UIViewController

@property (nonatomic,copy) void (^dismissBlock) (NextCenterBViewController *nextVC);

@end

NS_ASSUME_NONNULL_END
