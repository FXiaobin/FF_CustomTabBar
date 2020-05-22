//
//  FFTabBarAnimation.h
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/22.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FFTabBarAnimation : NSObject

/// 转场动画
+ (void)transationAnimationForViewWithType:(NSString *)type subType:(NSString *)subType forView:(UIView *)aView;

/// 抖动动画
+ (void)shakeAnimationWithAnimationView:(UIView *)animationView;
/// 缩放动画
+ (void)scaleAnimationWithAnimationView:(UIView *)animationView;
/// 旋转动画
+ (void)rotationAnimationWithAnimationView:(UIView *)animationView;
/** z轴旋转180度 */
+ (void)z_rotationAnimationWithAnimationView:(UIView *)animationView;
/** Y轴位移 向上移动  */
+ (void)y_moveAnimationWithAnimationView:(UIView *)animationView;
/** 透明度 - 呼吸动画 */
+ (void)huXiAnimationWithView:(UIView *)animationView;
/** 重力弹跳 上下动画 */
+ (void)locationPointAnimationWithAnimationView:(UIView *)animationView;
/** 放大缩小 - 呼吸 */
+ (void)buyScaleAnimationWithAnimationView:(UIView *)animationView;


@end

NS_ASSUME_NONNULL_END
