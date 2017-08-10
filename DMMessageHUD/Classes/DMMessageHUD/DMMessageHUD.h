//
//  DMMessageHUD.h
//  SAKitDemo
//
//  Created by 张炯 on 2017/6/29.
//  Copyright © 2017年 浙江网仓科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMMessageHUDView.h"
@interface DMMessageHUD : NSObject


/**
 
 @param view HUD所要展示的视图
 @param message HUD显示信息
 @param delay 显示时间
 */

+ (void)showHUDInView:(UIView *)view
              message:(NSString *)message
       hideAfterDelay:(CGFloat)delay;

+ (void)showHUDInView:(UIView *)view
              message:(NSString *)message
          locateStyle:(DMMessageHUDLocateStyle)style
       hideAfterDelay:(CGFloat)delay;

@end
