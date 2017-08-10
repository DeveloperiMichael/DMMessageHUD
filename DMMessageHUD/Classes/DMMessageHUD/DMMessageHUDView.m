//
//  DMMessageHUD.m
//  SAKitDemo
//
//  Created by 张炯 on 2017/6/29.
//  Copyright © 2017年 浙江网仓科技有限公司. All rights reserved.
//

#import "DMMessageHUDView.h"
#import <Masonry/Masonry.h>

@interface DMMessageHUDView()

/**
 HUD 位置
 */
@property (nonatomic, assign) DMMessageHUDLocateStyle locateStyle;


/**
 显示信息
 */
@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) UILabel *messageLabel;

@property (nonatomic, nullable, strong) UIView *contentView;

@end

@implementation DMMessageHUDView

#pragma mark-
#pragma mark- View Life Cycle

- (instancetype)initWithShowHUDInView:(UIView *)view
                      message:(NSString *)message
                  locateStyle:(DMMessageHUDLocateStyle)style {
    self = [super initWithFrame:view.frame];
    if (self) {
        self.message = message;
        self.locateStyle = style;
        [self setupSubviewsContraints];
        self.alpha = 0.0;
        [view addSubview:self];
    }
    return self;
}

- (instancetype)initWithShowHUDInView:(UIView *)view
                      message:(NSString *)message{
    self = [super initWithFrame:view.frame];
    if (self) {
        self.message = message;
        self.locateStyle = DMMessageHUDLocateTop;
        [self setupSubviewsContraints];
        self.alpha = 0.0;
        [view addSubview:self];
    }
    return self;
}



#pragma mark-
#pragma mark- Private Methods

- (void)show:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.25 animations:^{
            self.alpha = 1.0;
            switch (_locateStyle) {
                case DMMessageHUDLocateTop:
                    self.contentView.transform = CGAffineTransformTranslate(self.contentView.transform, 0, 70);
                    break;
                case DMMessageHUDLocateCenter:
                    
                    break;
                case DMMessageHUDLocateBottom:
                    self.contentView.transform = CGAffineTransformTranslate(self.contentView.transform, 0, -70);
                    break;
                default:
                    break;
            }
            
        }];
    }else{
        self.alpha = 1.0;
    }
    
}

- (void)hide:(BOOL)animated {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    if (animated) {
        [UIView animateWithDuration:0.25 animations:^{
            self.alpha = 0.0;
            self.contentView.transform = CGAffineTransformIdentity;
        }];
    }else{
        self.alpha = 0.0;
    }
    
    [self removeFromSuperview];
}


#pragma mark-
#pragma mark- Getters && Setters

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.text = _message;
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        _messageLabel.font =  [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f];
        _messageLabel.backgroundColor = [UIColor clearColor];
    }
    return _messageLabel;
}



- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor colorWithRed:9/255.0 green:113/255.0 blue:206/255.0 alpha:1];
        _contentView.clipsToBounds = YES;
        _contentView.layer.cornerRadius = 20.0f;
    }
    return _contentView;
}

#pragma mark-
#pragma mark- SetupConstraints

- (void)setupSubviewsContraints{
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.messageLabel];
    
    [_messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(_contentView);
        make.width.lessThanOrEqualTo(self.contentView).mas_offset(-20);
        make.height.mas_equalTo(_contentView);
    }];
    switch (_locateStyle) {
        case DMMessageHUDLocateTop:
        {
            [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self);
                make.width.mas_equalTo(0).priorityLow();
                make.top.mas_equalTo(self).mas_offset(20);
                make.height.mas_equalTo(40);
                make.width.lessThanOrEqualTo(self).mas_offset(-30);
            }];
        }
            break;
        case DMMessageHUDLocateCenter:
        {
            [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.mas_equalTo(self);
                make.height.mas_equalTo(40);
                make.width.mas_equalTo(0).priorityLow();
                make.width.lessThanOrEqualTo(self).mas_offset(-30);
            }];
        }
            break;
        case DMMessageHUDLocateBottom:
        {
            [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self);
                make.bottom.mas_equalTo(self).mas_offset(-20);
                make.height.mas_equalTo(40);
                make.width.mas_equalTo(0).priorityLow();
                make.width.lessThanOrEqualTo(self).mas_offset(-30);
            }];
        }
            break;
        default:
            break;
    }
}



@end
