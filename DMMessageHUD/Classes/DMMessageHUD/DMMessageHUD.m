//
//  DMMessageHUD.m
//  SAKitDemo
//
//  Created by 张炯 on 2017/6/29.
//  Copyright © 2017年 浙江网仓科技有限公司. All rights reserved.
//

#import "DMMessageHUD.h"

@implementation DMMessageHUD

+ (void)showHUDInView:(UIView *)view
              message:(NSString *)message
       hideAfterDelay:(CGFloat)delay{
    if (message.length>0) {
        DMMessageHUDView *hud = [[DMMessageHUDView alloc] initWithShowHUDInView:view message:message];
        [hud show:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
    }else{
        NSLog(@"message not exsit");
    }
    
}

+ (void)showHUDInView:(UIView *)view
              message:(NSString *)message
          locateStyle:(DMMessageHUDLocateStyle)style
       hideAfterDelay:(CGFloat)delay {
    if (message.length>0) {
        DMMessageHUDView *hud = [[DMMessageHUDView alloc] initWithShowHUDInView:view message:message locateStyle:style];
        [hud show:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
    }else{
        NSLog(@"message not exsit");
    }
    
}

@end
