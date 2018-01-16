//
//  JMButton.h
//  JMButton
//
//  Created by JM on 2018/1/8.
//  Copyright © 2018年 JM. All rights reserved.
//
/*
 .----------------. .----------------.
 | .--------------. | .--------------. |
 | |     _____    | | | ____    ____ | |
 | |    |_   _|   | | ||_   \  /   _|| |
 | |      | |     | | |  |   \/   |  | |
 | |   _  | |     | | |  | |\  /| |  | |
 | |  | |_' |     | | | _| |_\/_| |_ | |
 | |  `.___.'     | | ||_____||_____|| |
 | |              | | |              | |
 | '--------------' | '--------------' |
 '----------------' '----------------'
 github: https://github.com/JunAILiang
 blog: https://www.ljmvip.cn
 */

#import <UIKit/UIKit.h>
#import "JMBadgeValue.h"
#import "JMBaseButton.h"
#import "JMBaseButtonConfig.h"
#import "JMBootstrapButton.h"
#import "JMBootstrapButtonConfig.h"

@interface JMButton : UIView

- (instancetype)initWithFrame:(CGRect)frame ButtonConfig:(JMBaseButtonConfig *)buttonConfig;


/**
 点击事件
 @param target 事件目标
 @param action 事件方法
 @param controlEvents 事件类型
 */
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;




/********** 按钮角标配置及显示, 默认不显示角标, 如需要可通过如下方法设置 (frame必需要有值) **********/

/*****  请注意, 如果需要自定义角标的样式(如调用时下面五个属性时必需在show方法之前设置调用 *****/

/** 角标的文字颜色 (默认 #FFFFFF) */
@property (nonatomic, strong) UIColor *badgeTextColor;
/** 角标的背景颜色 (默认 #FF4040) */
@property (nonatomic, strong) UIColor *badgeBackgroundColor;
/** badgeTextFont (如没有特殊需求, 请勿修改此属性, 此属性只有在控制器加载完成后有效)*/
@property (nonatomic, strong) UIFont *badgeTextFont;
/** badgeSize (如没有特殊需求, 请勿修改此属性, 此属性只有在控制器加载完成后有效)*/
@property (nonatomic, assign) CGSize badgeSize;
/** badgeOffset (如没有特殊需求, 请勿修改此属性, 此属性只有在控制器加载完成后有效) */
@property (nonatomic, assign) CGPoint badgeOffset;
/** badge圆角大小 (如没有特殊需求, 请勿修改此属性, 此属性只有在控制器加载完成后有效, 一般配合badgeSize或badgeOffset使用) */
@property (nonatomic, assign) CGFloat badgeRadius;

/*****  请注意, 如果需要自定义角标的样式(如调用时上面五个属性时必需在show方法之前设置调用 *****/

/** 动画类型 */
@property (nonatomic, assign) JMBadgeValueAnimationType badgeAnimationType;
/** badgeValue(角标数值, 仅对 数值样式有效) */
@property (nonatomic, copy) NSString *badgeValue;

/**
 显示小红点样式
 */
- (void)showPointBadgeValue;

/**
 显示New样式
 */
- (void)showNewBadgeValue;

/**
 显示数值样式
 @param badgeValue 数值
 */
- (void)showNumberBadgeValue:(NSString *)badgeValue;

/**
 删除小红点
 */
- (void)removeBadgeValue;

/**
 展示动画
 */
- (void)showBadgeAnimation;



@end











