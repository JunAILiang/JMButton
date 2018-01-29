//
//  JMBaseButton+CountDown.h
//  JMButton
//
//  Created by JM on 2018/1/17.
//  Copyright © 2018年 JM. All rights reserved.
//

#import "JMBaseButton.h"

@interface JMBaseButton (CountDown)
/**
 开始倒计时
 @param time 倒计时时间
 */
- (void)startCountDown:(int)time;

/**
 开始倒计时
 @param time 倒计时时间
 @param detail 文字描述 (默认是  **秒后重新获取)
 */
- (void)startCountDown:(int)time Detail:(NSString *)detail;


/** 倒计时中背景颜色(默认 不设置) */
@property (nonatomic, strong) UIColor *countDownBackground;
/** 倒计时完成后背景颜色 (默认 不设置) */
@property (nonatomic, strong) UIColor *countDownDoneBackground;
/** 倒计时边框颜色 (默认 不设置) */
@property (nonatomic, strong) UIColor *countDownBorderColor;
/** 倒计时完成后边框颜色 (默认 不设置) */
@property (nonatomic, strong) UIColor *countDownDoneBorderColor;

@end
