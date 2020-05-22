//
//  FFBTabBar.h
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/21.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import <UIKit/UIKit.h>

/**

   不移除TabBar上的所有子视图，而是将UIButton添加到对应的UIBarButtonItem上
    当你给UITabBarController的viewControllers属性添加子控制器时，UITabBarController的tabBar会自动创建对应子控制器个数的UIBarButtonItem，
    如果你没有设置UIBarButtonItem的标题 图片 选中图片 你是看不到的，可以通过层级关系来看到
 
    所以，自定义tabBar，可以将自己创建的UIButton直接添加到对应的UIBarButtonItem上即可

*/


NS_ASSUME_NONNULL_BEGIN

@interface FFBTabBar : UITabBar

/** 是否显示顶部分割线 默认为NO显示 */
@property (nonatomic,assign) BOOL isHiddenTopLine;

/** 设置当前选中的索引 */
@property (nonatomic,assign) NSInteger selectedIndex;

/** 按钮点击回调 */
@property (nonatomic,copy) void (^tabBarButtonActionBlock) (FFBTabBar *aTabBar,NSInteger index, UIButton *sender);

/** 初始化FFATabBar */
-(instancetype)initWithTitles:(NSArray *)titles images:(NSArray *)images selctedImages:(NSArray *)selctedImages;



@end

NS_ASSUME_NONNULL_END
