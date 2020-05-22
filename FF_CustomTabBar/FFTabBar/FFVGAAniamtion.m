//
//  FFVGAAniamtion.m
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/22.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import "FFVGAAniamtion.h"

#define kTabBarItem_H   27.0

@implementation FFVGAAniamtion

+(void)pahts_home:(UIImageView *)imageView contentView:(UIView *)contentView{
    
    UIColor* fillColor = kMainColor;
    //[UIColor colorWithRed: 0.063 green: 0.592 blue: 1 alpha: 1];
    UIColor* strokeColor = kMainColor;
    //[UIColor colorWithRed: 0.063 green: 0.592 blue: 1 alpha: 1];
    
    /**
     vag文件是80*80 我们item实际占用27.0
     */
    CGFloat scale = kTabBarItem_H / 80.0;
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(37.65 * scale , 62.35 * scale , 4.7 * scale , 10 * scale )];
    [fillColor setFill];
    [rectanglePath fill];


    //// Rectangle 2 Drawing
    UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(26.87 * scale , 7.64 * scale , 26.26 * scale , 45.01 * scale ) cornerRadius: 13.13 * scale ];
    [strokeColor setStroke];
    rectangle2Path.lineWidth = 5 * scale ;
    [rectangle2Path stroke];


    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(63 * scale , 38.2 * scale )];
    [bezierPath addLineToPoint: CGPointMake(63.01 * scale , 38 * scale )];
    [bezierPath addCurveToPoint: CGPointMake(61.23 * scale , 48.08 * scale ) controlPoint1: CGPointMake(62.83 * scale , 41.42 * scale ) controlPoint2: CGPointMake(62.23 * scale , 44.81 * scale )];
    [bezierPath addCurveToPoint: CGPointMake(41.41 * scale , 63.51 * scale ) controlPoint1: CGPointMake(58.28 * scale , 56.95 * scale ) controlPoint2: CGPointMake(50.78 * scale , 62.58 * scale )];
    [bezierPath addCurveToPoint: CGPointMake(19.84 * scale , 50.38 * scale ) controlPoint1: CGPointMake(31.09 * scale , 63.51 * scale ) controlPoint2: CGPointMake(25.47 * scale , 59.76 * scale )];
    [bezierPath addCurveToPoint: CGPointMake(17 * scale , 38.2 * scale ) controlPoint1: CGPointMake(17 * scale , 45.7 * scale ) controlPoint2: CGPointMake(17 * scale , 38.2 * scale )];
    [strokeColor setStroke];
    bezierPath.lineWidth = 5 * scale ;
    bezierPath.lineCapStyle = kCGLineCapRound;
    [bezierPath stroke];

    NSArray *arr = @[rectanglePath,rectangle2Path,bezierPath];
    
    for (UIBezierPath *path in arr) {
         CAShapeLayer *backCircle = [CAShapeLayer layer];
        backCircle.lineWidth = 5 * scale;  // 线条宽度
         backCircle.strokeColor = [kMainColor CGColor]; // 边缘线的颜色
         backCircle.fillColor = [[UIColor clearColor] CGColor];  // 闭环填充的颜色
         backCircle.lineCap = @"round";  // 边缘线的类型
         backCircle.path = path.CGPath; // 从贝塞尔曲线获取到形状
      
       [contentView.layer addSublayer:backCircle];
        
        // 动画
        CABasicAnimation *animation = [CABasicAnimation animation];
        animation.keyPath = @"strokeEnd";
        animation.duration = 0.5; // 动画时长
        animation.fromValue = @0; // 开始值
         animation.toValue = @1;
        // backCircle.strokeEnd = 1;
         animation.removedOnCompletion = NO;
        // 给layer添加动画
        [backCircle addAnimation:animation forKey:nil];
    }
  
}


+(void)pahts_file:(UIImageView *)imageView contentView:(UIView *)contentView{
    
    UIColor* fillColor = kMainColor;
     //[UIColor colorWithRed: 0.063 green: 0.592 blue: 1 alpha: 1];
     UIColor* strokeColor = [UIColor redColor];
     //[UIColor colorWithRed: 0.063 green: 0.592 blue: 1 alpha: 1];
     
     
     CGFloat scale = kTabBarItem_H / 80.0;
     
     UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(10 * scale, 13 * scale, 60 * scale, 54 * scale) cornerRadius: 10 * scale];
    [strokeColor setStroke];
    rectanglePath.lineWidth = 5 * scale;
    [rectanglePath stroke];


    //// Rectangle 2 Drawing
    UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(25 * scale, 13.5 * scale, 30 * scale, 20 * scale) cornerRadius: 2 * scale];
    [strokeColor setStroke];
    rectangle2Path.lineWidth = 5 * scale;
    [rectangle2Path stroke];


    //// Rectangle 3 Drawing
    UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRect: CGRectMake(43.5 * scale, 20 * scale, 2 * scale, 6 * scale)];
    [fillColor setFill];
    [rectangle3Path fill];

     NSArray *arr = @[rectanglePath,rectangle2Path,rectangle3Path];
        
        for (UIBezierPath *path in arr) {
             CAShapeLayer *backCircle = [CAShapeLayer layer];
            backCircle.lineWidth = 5 * scale;  // 线条宽度
             backCircle.strokeColor = [kMainColor CGColor]; // 边缘线的颜色
             backCircle.fillColor = [[UIColor clearColor] CGColor];  // 闭环填充的颜色
             backCircle.lineCap = @"round";  // 边缘线的类型
             backCircle.path = path.CGPath; // 从贝塞尔曲线获取到形状
          
           [contentView.layer addSublayer:backCircle];
            
            // 动画
            CABasicAnimation *animation = [CABasicAnimation animation];
            animation.keyPath = @"strokeEnd";
            animation.duration = 0.5; // 动画时长
            animation.fromValue = @0; // 开始值
             animation.toValue = @1;
            // backCircle.strokeEnd = 1;
             animation.removedOnCompletion = NO;
            // 给layer添加动画
            [backCircle addAnimation:animation forKey:nil];
        }
}


+(void)pahts_my:(UIImageView *)imageView contentView:(UIView *)contentView{
    
    UIColor* strokeColor = kMainColor;
     //[UIColor colorWithRed: 0.063 green: 0.592 blue: 1 alpha: 1];
     
     CGFloat scale = kTabBarItem_H / 80.0;
     
     //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(27.2 * scale, 18.34 * scale, 25.6 * scale, 25.6 * scale)];
    [strokeColor setStroke];
    ovalPath.lineWidth = 5 * scale;
    [ovalPath stroke];


    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(70.32 * scale, 61.66 * scale)];
    [bezierPath addCurveToPoint: CGPointMake(9.68 * scale, 61 * scale) controlPoint1: CGPointMake(50 * scale, 39.18 * scale) controlPoint2: CGPointMake(28.82 * scale, 39.55 * scale)];
    [strokeColor setStroke];
    bezierPath.lineWidth = 5 * scale;
    [bezierPath stroke];

     NSArray *arr = @[ovalPath,bezierPath];
           
       for (UIBezierPath *path in arr) {
            CAShapeLayer *backCircle = [CAShapeLayer layer];
           backCircle.lineWidth = 5 * scale;  // 线条宽度
            backCircle.strokeColor = [kMainColor CGColor]; // 边缘线的颜色
            backCircle.fillColor = [[UIColor clearColor] CGColor];  // 闭环填充的颜色
            backCircle.lineCap = @"round";  // 边缘线的类型
            backCircle.path = path.CGPath; // 从贝塞尔曲线获取到形状
         
          [contentView.layer addSublayer:backCircle];
           
           // 动画
           CABasicAnimation *animation = [CABasicAnimation animation];
           animation.keyPath = @"strokeEnd";
           animation.duration = 0.5; // 动画时长
           animation.fromValue = @0; // 开始值
            animation.toValue = @1;
           // backCircle.strokeEnd = 1;
            animation.removedOnCompletion = NO;
           // 给layer添加动画
           [backCircle addAnimation:animation forKey:nil];
       }

}


@end
