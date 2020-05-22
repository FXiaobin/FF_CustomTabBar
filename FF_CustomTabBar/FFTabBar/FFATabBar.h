//
//  FFATabBar.h
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/21.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 
    移除TabBar上的所有子视图 重新添加UIButton
 
 */

NS_ASSUME_NONNULL_BEGIN

@interface FFATabBar : UITabBar

/** 是否显示顶部分割线 默认为NO 不显示 */
@property (nonatomic,assign) BOOL isShowTopLine;

/** 设置当前选中的索引 */
@property (nonatomic,assign) NSInteger selectedIndex;

/** 按钮点击回调 */
@property (nonatomic,copy) void (^tabBarButtonActionBlock) (FFATabBar *aTabBar,NSInteger index, UIButton *sender);

/** 初始化FFATabBar */
-(instancetype)initWithTitles:(NSArray *)titles images:(NSArray *)images selctedImages:(NSArray *)selctedImages;


@end

NS_ASSUME_NONNULL_END
