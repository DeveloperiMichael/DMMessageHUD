//
//  DMMessageHUD.h
//  SAKitDemo
//
//  Created by 张炯 on 2017/6/29.
//  Copyright © 2017年 浙江网仓科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMMessageHUDView : UIView


/**
 HUD 位置

 - DMMessageHUDLocateTop: 顶部
 - DMMessageHUDLocateCenter: 中心
 - DMMessageHUDLocateBottom: 底部
 */
typedef NS_ENUM(NSInteger, DMMessageHUDLocateStyle) {
    DMMessageHUDLocateTop = 0,
    DMMessageHUDLocateCenter,
    DMMessageHUDLocateBottom,
};



/**
 实例化对象

 @param view HUD所要展示的视图
 @param message HUD显示信息
 @param style HUD位置
 @return 实例对象
 */
- (instancetype)initWithShowHUDInView:(UIView *)view
              message:(NSString *)message
                  locateStyle:(DMMessageHUDLocateStyle)style;

- (instancetype)initWithShowHUDInView:(UIView *)view
                      message:(NSString *)message;


- (void)show:(BOOL)animated;

- (void)hide:(BOOL)animated;

@end
