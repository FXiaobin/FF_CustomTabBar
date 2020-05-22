//
//  FFCenterBTabBar.m
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/22.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import "FFCenterBTabBar.h"

@interface FFCenterBTabBar ()

@property (nonatomic,strong) UIButton *centerBtn;

@end

@implementation FFCenterBTabBar

-(instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
     
        
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];

    // 不要添加在初始化方法中，会有莫名其妙误触的bug
    // 将centerBtn添加到最上层 这样点击的时候就不会有问题了
    [self addSubview:self.centerBtn];
    
    CGFloat width = self.frame.size.width;
    CGFloat height = 49;
    
    CGPoint center = CGPointMake(width / 2.0, height / 2.0);
    
    CGFloat buttonY = 0;
    CGFloat buttonW = width / 3;
    CGFloat buttonH = height;
    NSInteger index = 0;
    
    // 设置发布按钮的frame
    _centerBtn.frame = CGRectMake(0, 0, buttonW, _centerBtn.currentImage.size.height);
    // 不偏移 居中
    //_centerBtn.center = center;
    // 向上偏移
    center.y -= 8.0;
    _centerBtn.center = center;
   
    
    // 设置其他UITabBarButton的frame
    // 重新布局系统的UITabBarButton
    for (UIView *subv in self.subviews) {
        if (![subv isKindOfClass:[UIControl class]] || subv == self.centerBtn) continue;
        
        // 计算按钮的x值
        CGFloat buttonX = buttonW * ((index > 0) ? (index + 1):index);
        subv.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 增加索引
        index++;
    }
    
}


-(void)tabBarCenterButtonAction:(UIButton *)sender{
    
    if (self.tabBarCenterButtonActionBlock) {
        self.tabBarCenterButtonActionBlock(self, sender);
    }
}

-(UIButton *)centerBtn{
    if (_centerBtn == nil) {
        _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //_centerBtn.backgroundColor = [UIColor orangeColor];
         [_centerBtn setImage:[UIImage imageNamed:@"tabBar_center"] forState:UIControlStateNormal];
         [_centerBtn setImage:[UIImage imageNamed:@"tabBar_center"] forState:UIControlStateSelected];
         [_centerBtn addTarget:self action:@selector(tabBarCenterButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_centerBtn sizeToFit];
        //_centerBtn.frame = CGRectMake(0, 0, _centerBtn.currentImage.size.width, _centerBtn.currentImage.size.height);
        
        //[_centerBtn setTitle:@"" forState:UIControlStateNormal];
        //[_centerBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        //[_centerBtn setTitleColor:kMainColor forState:UIControlStateSelected];
        //_centerBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        //[_centerBtn setImagePositionWithType:SSImagePositionTypeLeft spacing:5.0];
    }
    return _centerBtn;
}

@end
