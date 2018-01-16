//
//  JMBadgeValue.h
//  JMTabBarController
//
//  Created by JM on 2018/1/2.
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

/** badgeValue样式 */
typedef NS_ENUM(NSInteger, JMBadgeValueType) {
    JMBadgeValueTypePoint, //点
    JMBadgeValueTypeNew, //new
    JMBadgeValueTypeNumber, //number
};

/** badgeValue 动画样式 */
typedef NS_ENUM(NSInteger, JMBadgeValueAnimationType) {
    JMBadgeValueAnimationTypeNone, //无动画
    JMBadgeValueAnimationTypeShake, //抖动
    JMBadgeValueAnimationTypeOpacity, //透明过渡动画
    JMBadgeValueAnimationTypeScale, //缩放动画
};

@interface JMBadgeValue : UIView

/** badgeL */
@property (nonatomic, strong) UILabel *badgeL;
/** type */
@property (nonatomic, assign) JMBadgeValueType type;
/** animationType */
@property (nonatomic, assign) JMBadgeValueAnimationType animationType;
/** badgeValue */
@property (nonatomic, copy) NSString *badgeValue;
@property (nonatomic, assign) CGFloat badgeRadius;


- (void)showAnimation;

@end
