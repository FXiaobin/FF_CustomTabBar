//
//  FFVGAAniamtion.h
//  FF_CustomTabBar
//
//  Created by chuangku on 2020/5/22.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
    这个动画类里面的动画都是vag文件对应的动画
    需要下载一个软件：paintCode
    将Vag文件导入到软件中，会生成对应的贝塞尔路径代码，我们只需要拷贝过来就可以了，
        然后根据路径个数创建对应个数的layer，最后给每一个layer做一个绘制的动画即可
 */

NS_ASSUME_NONNULL_BEGIN

@interface FFVGAAniamtion : NSObject

+(void)pahts_home:(UIImageView *)imageView contentView:(UIView *)contentView;

+(void)pahts_file:(UIImageView *)imageView contentView:(UIView *)contentView;

+(void)pahts_my:(UIImageView *)imageView contentView:(UIView *)contentView;

@end

NS_ASSUME_NONNULL_END
