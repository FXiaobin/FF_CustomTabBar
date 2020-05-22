//
//  FFBTabBar.m
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/21.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import "FFBTabBar.h"
#import "TYFWaveButton.h"

#define kFFATabBar_ButtonTag    200000

@interface FFBTabBar ()

@property (nonatomic,strong) NSArray *titles;
@property (nonatomic,strong) NSArray *images;
@property (nonatomic,strong) NSArray *selectedImages;

@property (nonatomic,strong) UIButton *selctedBtn;

@property (nonatomic,strong) NSMutableArray *buttonItems;


@end

@implementation FFBTabBar

-(NSMutableArray *)buttonItems{
    if (_buttonItems == nil) {
        _buttonItems = [NSMutableArray array];
    }
    return _buttonItems;
}

-(instancetype)initWithTitles:(NSArray *)titles images:(NSArray *)images selctedImages:(NSArray *)selctedImages{
    if (self = [super init]) {
   
        _selectedIndex = 0;
        _titles = titles;
        _images = images;
        _selectedImages = selctedImages;
        
        // 不半透明
        self.translucent = NO;
        
        for (int i = 0; i <_titles.count; i++) {
             TYFWaveButton *button = [TYFWaveButton buttonWithType:UIButtonTypeCustom];
            // button.frame = CGRectMake(buttonW * i, buttonY, buttonW, buttonH);
             [button setTitle:_titles[i] forState:UIControlStateNormal];
             [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
             [button setTitleColor:kMainColor forState:UIControlStateSelected];
             button.titleLabel.font = [UIFont systemFontOfSize:16.0];
             [button setImage:[[UIImage imageNamed:_images[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
             [button setImage:[[UIImage imageNamed:_selectedImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
             button.tag = kFFATabBar_ButtonTag + i;
             [button addTarget:self action:@selector(tabBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
             
             [button setImagePositionWithType:SSImagePositionTypeLeft spacing:5.0];
             //[button setImagePositionWithType:SSImagePositionTypeTop spacing:2.0];
            
            button.radiusofWaveStart = 0;
            button.radiusofWaveEnd = 20;
            button.colorofwave = [UIColor cyanColor];
            button.timeofwave = 1.0/2;
            button.onlycenter = YES;
             
             if (i == _selectedIndex) {
                 button.selected = YES;
                 self.selctedBtn = button;
             }
            
            [self.buttonItems addObject:button];
        }
        
    }
    return self;
}

-(void)setIsHiddenTopLine:(BOOL)isHiddenTopLine{
    _isHiddenTopLine = isHiddenTopLine;
    if (isHiddenTopLine) {
        self.shadowImage = [UIImage new];
        self.clipsToBounds = YES;
        self.layer.borderWidth = 0.0;
    }
}
    

- (void)layoutSubviews{
    
    [super layoutSubviews];
        
    if (_titles.count == 0) {
        return;
    }
    
    /**
        获取系统的UITabBarButton
     */
    NSMutableArray *systemTabBarButtons = [NSMutableArray array];
    // UITabBarButton
    for (UIView *subv in self.subviews) {
        if ([subv isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [systemTabBarButtons addObject:subv];
        }
    }
   
    /**
        将自定义的UIButton添加到对应的系统的UITabBarButton上
     */
    for (int i = 0; i < self.buttonItems.count; i++) {
        UIButton *customBtn = self.buttonItems[i];
        UIControl *systemBtn = systemTabBarButtons[i];
        
        customBtn.frame = systemBtn.bounds;
        [systemBtn addSubview:customBtn];
    }
   
}

-(void)tabBarButtonAction:(UIButton *)sender{
    
    NSInteger tag = sender.tag - kFFATabBar_ButtonTag;
    
    if (self.tabBarButtonActionBlock) {
        self.tabBarButtonActionBlock(self, tag, sender);
    }
    
    // 点击状态的切换放到外面做处理，因为外面可能会做一些拦截操作而不需要切换状态的情况
    // 例如：非VIP用户不能进入某一个tabBar模块
    //self.selectedIndex = tag;
 
}

-(void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    
    UIButton *sender = self.buttonItems[selectedIndex];
    
    self.selctedBtn.selected = NO;
    sender.selected = YES;
    self.selctedBtn = sender;
}


@end
