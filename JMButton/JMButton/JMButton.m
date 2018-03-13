//
//  JMButton.m
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

#import "JMButton.h"
#import "JMRuntime.h"
#import "UIView+JM.h"
#import "UIColor+JM.h"

@interface JMButton()

/** baseButton */
@property (nonatomic, strong) JMBaseButton *baseButton;
/** badgeValue */
@property (nonatomic, strong) JMBadgeValue *bv;

@end

@implementation JMButton

- (instancetype)initWithFrame:(CGRect)frame NumberButtonConfig:(JMNumberButtonConfig *)numberButtonConfig {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame CustomView:(UIView *)customView {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:customView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame ButtonConfig:(JMBaseButtonConfig *)buttonConfig {
    if (self = [super initWithFrame:frame]) {
        if ([buttonConfig isMemberOfClass:[JMBaseButtonConfig class]]) {
            self.baseButton = [[JMBaseButton alloc] initWithFrame:self.bounds ButtonConfig:buttonConfig];
        } else if ([buttonConfig isMemberOfClass:[JMBootstrapButtonConfig class]]) {
            self.baseButton = [[JMBootstrapButton alloc] initWithFrame:self.bounds ButtonConfig:buttonConfig];
        } else if ([buttonConfig isMemberOfClass:[JMWaveButtonConfig class]]) {
            self.baseButton = [[JMWaveButton alloc] initWithFrame:self.bounds ButtonConfig:buttonConfig];
        }
        
        if (buttonConfig.cornerRadius != 0) {
            if (buttonConfig.corners == UIRectCornerAllCorners) {
                self.baseButton.layer.cornerRadius = buttonConfig.cornerRadius;
                self.baseButton.layer.borderColor = buttonConfig.borderColor.CGColor;
                self.baseButton.layer.borderWidth = buttonConfig.borderWidth;
                self.baseButton.layer.masksToBounds = YES;
            } else {
                UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.baseButton.bounds byRoundingCorners:buttonConfig.corners cornerRadii:CGSizeMake(buttonConfig.cornerRadius, buttonConfig.cornerRadius)];
                
                CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
                maskLayer.frame = self.bounds;
                maskLayer.path = maskPath.CGPath;
                
                CAShapeLayer *borderMaskLayer = [CAShapeLayer layer];
                borderMaskLayer.path = maskPath.CGPath;
                borderMaskLayer.lineWidth = buttonConfig.borderWidth;
                borderMaskLayer.strokeColor = buttonConfig.borderColor.CGColor;
                borderMaskLayer.fillColor = [UIColor clearColor].CGColor;
                
                self.baseButton.layer.mask = maskLayer;
                [self.baseButton.layer addSublayer:borderMaskLayer];
            }
        }
        
        [self addSubview:self.baseButton];
    }
    
    return self;
}

- (void)setTag:(NSInteger)tag {
    self.baseButton.tag = tag;
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    [self.baseButton addTarget:target action:action forControlEvents:controlEvents];
}

- (void)showPointBadgeValue {
    [self setupBadgeValueType:JMBadgeValueTypePoint];
    [self addSubview:self.bv];
}

- (void)showNewBadgeValue {
    [self setupBadgeValueType:JMBadgeValueTypeNew];
    [self addSubview:self.bv];
}

- (void)showNumberBadgeValue:(NSString *)badgeValue {
    [self setupBadgeValueType:JMBadgeValueTypeNumber];
    self.bv.badgeValue = badgeValue;
    [self addSubview:self.bv];
}

- (void)setupBadgeValueType:(JMBadgeValueType)type {
    CGFloat badgeX = self.badgeOffset.x ? CGRectGetMaxX(self.bounds) - 10 + self.badgeOffset.x : CGRectGetMaxX(self.bounds) - 10;
    CGFloat badgeY = self.badgeOffset.y ? CGRectGetMinY(self.bounds) + self.badgeOffset.y : CGRectGetMinY(self.bounds);
    CGFloat badgeH = self.badgeSize.width ? self.badgeSize.width : 16;
    CGFloat badgeW = self.badgeSize.height ? self.badgeSize.height : 24;
    self.bv = [[JMBadgeValue alloc] initWithFrame:CGRectMake(badgeX, badgeY, badgeW, badgeH)];
    self.bv.badgeL.font = self.badgeTextFont ? self.badgeTextFont : [UIFont systemFontOfSize:11.f];
    self.bv.badgeL.textColor = self.badgeTextColor ? self.badgeTextColor : [UIColor whiteColor];
    self.bv.badgeL.backgroundColor = self.badgeBackgroundColor ? self.badgeBackgroundColor : [UIColor colorWithHexString:@"#FF4040"];
    self.bv.type = type;
    self.bv.animationType = self.badgeAnimationType;
}

- (void)setBadgeValue:(NSString *)badgeValue {
    _badgeValue = badgeValue;
    if (self.badgeAnimationType == JMBadgeValueTypeNumber) {
        self.bv.badgeValue = badgeValue;
    }
}

- (void)setBadgeRadius:(CGFloat)badgeRadius {
    _badgeRadius = badgeRadius;
    self.bv.badgeRadius = badgeRadius;
}

- (void)removeBadgeValue {
    [self.bv removeFromSuperview];
}

- (void)showBadgeAnimation {
    [self.bv showAnimation];
}


@end


