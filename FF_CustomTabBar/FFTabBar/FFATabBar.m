//
//  FFATabBar.m
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/21.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import "FFATabBar.h"

#define kFFATabBar_ButtonTag    200000

@interface FFATabBar ()

@property (nonatomic,strong) NSArray *titles;
@property (nonatomic,strong) NSArray *images;
@property (nonatomic,strong) NSArray *selectedImages;

@property (nonatomic,strong) UIButton *selctedBtn;

@property (nonatomic,strong) UIImageView *topLine;

@end

@implementation FFATabBar



-(instancetype)initWithTitles:(NSArray *)titles images:(NSArray *)images selctedImages:(NSArray *)selctedImages{
    if (self = [super init]) {
   
        _selectedIndex = 0;
        _titles = titles;
        _images = images;
        _selectedImages = selctedImages;
        
        // 不半透明
        self.translucent = NO;
        
        
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
        
    if (_titles.count == 0) {
        return;
    }
    
    // 要先移除用不到是子视图
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
     // 不半透明
      self.translucent = NO;

      CGFloat width = self.frame.size.width;
      CGFloat height = 49.0;
    
      // 设置其他UITabBarButton的frame
      CGFloat buttonY = 0;
      CGFloat buttonW = width / _titles.count;
      CGFloat buttonH = height;
      
      for (int i = 0; i <_titles.count; i++) {
          UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
          button.frame = CGRectMake(buttonW * i, buttonY, buttonW, buttonH);
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
          
          if (i == _selectedIndex) {
              button.selected = YES;
              self.selctedBtn = button;
          }
          
          [self addSubview:button];
      }
    
    if (self.isShowTopLine) {
        self.topLine.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), 0.5);
        [self addSubview:self.topLine];
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
    
    UIButton *sender = (UIButton *)[self viewWithTag:kFFATabBar_ButtonTag + selectedIndex];
    
    self.selctedBtn.selected = NO;
    sender.selected = YES;
    self.selctedBtn = sender;
}

-(UIImageView *)topLine{
    if (_topLine == nil) {
        _topLine = [UIImageView new];
        _topLine.backgroundColor = [UIColor darkGrayColor];
    }
    return _topLine;
}

@end
