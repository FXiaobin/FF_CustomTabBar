//
//  FFTabBarAnimation.m
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/22.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import "FFTabBarAnimation.h"

@implementation FFTabBarAnimation

#pragma mark ---  转场动画
+ (void)transationAnimationForViewWithType:(NSString *)type subType:(NSString *)subType forView:(UIView *)aView{
    
    CATransition *transtion = [CATransition animation];
    //[transtion setStartProgress:0.2];
    //[transtion setEndProgress:0.8];
    transtion.duration = 1.0;
    [transtion setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [transtion setType:type];
    
    //kCATransitionFromTop
    [transtion setSubtype:subType];
    
    [aView.layer addAnimation:transtion forKey:@"transtionKey"];
}

#pragma mark --- 核心动画
/// 左右抖动
+ (void)shakeAnimationWithAnimationView:(UIView *)animationView{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];

    [animation setDuration:0.1];
    //抖动角度
    animation.fromValue = @(-M_1_PI/2);
    animation.toValue = @(M_1_PI/2);
    //重复次数，2次
    animation.repeatCount = 2;
    //恢复原样
    animation.autoreverses = YES;
    //锚点设置为图片中心，绕中心抖动
    animationView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    
    [animationView.layer addAnimation:animation forKey:@"rotation"];
}

/// 点赞放大缩小
+ (void)scaleAnimationWithAnimationView:(UIView *)animationView{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.values = @[@2.0 ,@1.4, @1.8,@1.2,@1.5, @2.0,@1.5,@1.0];
    animation.duration = 1.0;
    animation.calculationMode = kCAAnimationCubic;
    [animationView.layer addAnimation:animation forKey:@"transform.scale"];
}

+ (void)rotationAnimationWithAnimationView:(UIView *)animationView{
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(M_PI*2.0);
    rotationAnimation.duration = 0.5;
    rotationAnimation.cumulative = YES;
    //rotationAnimation.repeatCount = MAXFLOAT;//一直旋转
    [animationView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

/** z轴旋转180度 */
+ (void)z_rotationAnimationWithAnimationView:(UIView *)animationView{
    
    //z轴旋转180度
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //速度控制函数，控制动画运行的节奏
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 0.2;       //执行时间
    animation.repeatCount = 1;      //执行次数
    animation.removedOnCompletion = YES;
    animation.fromValue = [NSNumber numberWithFloat:0];   //初始伸缩倍数
    animation.toValue = [NSNumber numberWithFloat:M_PI];     //结束伸缩倍数
    
    [[animationView layer] addAnimation:animation forKey:nil];
}

/** Y轴位移 向上移动  */
+ (void)y_moveAnimationWithAnimationView:(UIView *)animationView{
    
    //向上移动
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    //速度控制函数，控制动画运行的节奏
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 0.2;       //执行时间
    animation.repeatCount = 1;      //执行次数
    animation.removedOnCompletion = YES;
    animation.fromValue = [NSNumber numberWithFloat:0];   //初始伸缩倍数
    animation.toValue = [NSNumber numberWithFloat:-10];     //结束伸缩倍数
    
    [[animationView layer] addAnimation:animation forKey:nil];
}

/** 呼吸灯动画 */
+ (void)huXiAnimationWithView:(UIView *)animationView{

    CABasicAnimation *animation =[CABasicAnimation animationWithKeyPath:@"opacity"];
 
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:0.1f];//这是透明度。
    animation.autoreverses = YES; //回退动画（动画可逆，即循环）
    animation.duration = 1.5;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];

    [animationView.layer addAnimation:animation forKey:@"opactiyAnimation"];
}

/** 重力弹跳 上下动画 */
+ (void)locationPointAnimationWithAnimationView:(UIView *)animationView{
  
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    //通过初中物理重力公式计算出的位移y值数组
    animation.values = @[@0.0, @-4.15, @-7.26, @-9.34, @-10.37, @-9.34, @-7.26, @-4.15, @0.0, @2.0, @-2.9, @-4.94, @-6.11, @-6.42, @-5.86, @-4.44, @-2.16, @0.0];
    animation.duration = 0.8;
    animation.beginTime = CACurrentMediaTime() + 0.1;

    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

    [animationView.layer addAnimation:animation forKey:nil];
}


+ (void)buyScaleAnimationWithAnimationView:(UIView *)animationView{
  
    CABasicAnimation *animation =[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.fromValue = [NSNumber numberWithFloat:0.9f];
    animation.toValue = [NSNumber numberWithFloat:1.1f];//这是透明度。
    animation.autoreverses = YES; //回退动画（动画可逆，即循环）
    animation.duration = 0.5;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];

    [animationView.layer addAnimation:animation forKey:@"scaleAnimation"];
}



@end
