//
//  JMBadgeValue.m
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

#import "JMBadgeValue.h"
#import "UIColor+JM.h"
#import "UIView+JM.h"

#define angle2Rad(angle) ((angle) / 180.0 * M_PI)


@interface JMBadgeValue()

@end

@implementation JMBadgeValue

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.badgeL = [[UILabel alloc] initWithFrame:self.bounds];
        self.badgeL.textAlignment = NSTextAlignmentCenter;
        self.badgeL.layer.cornerRadius = 8.f;
        self.badgeL.layer.masksToBounds = YES;
        [self addSubview:self.badgeL];
    }
    return self;
}

- (void)setType:(JMBadgeValueType)type {
    _type = type;
    if (type == JMBadgeValueTypePoint) {
        self.badgeL.size = CGSizeMake(10, 10);
        self.badgeL.layer.cornerRadius = 5.f;
        self.badgeL.x = 0;
        self.badgeL.y = self.height * 0.5 - self.badgeL.size.height * 0.5;
    } else if (type == JMBadgeValueTypeNew) {
        self.badgeL.text = @"new";
        self.badgeL.size = CGSizeMake(self.width, self.height);
    }
}

- (void)setBadgeValue:(NSString *)badgeValue {
    _badgeValue = badgeValue;
    self.badgeL.text = badgeValue;
    CGSize size = CGSizeZero;
    CGFloat radius = 8.f;
    if (self.badgeL.text.length <= 1) {
        size = CGSizeMake(self.height, self.height);
        radius = self.height * 0.5;
    } else if (self.badgeL.text.length > 1) {
        size = self.bounds.size;
        radius = 8.f;
    }
    self.badgeL.size = size;
    self.badgeL.layer.cornerRadius = radius;
}

- (void)setBadgeRadius:(CGFloat)badgeRadius {
    _badgeRadius = badgeRadius;
    self.badgeL.layer.cornerRadius = badgeRadius;
}

- (void)showAnimation {
    if (self.animationType == JMBadgeValueAnimationTypeScale) {
        CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        anima.toValue = [NSNumber numberWithFloat:1.2f];
        anima.duration = 0.3f;
        anima.repeatCount = 3;
        anima.autoreverses = YES;
        [self.badgeL.layer addAnimation:anima forKey:@"scale"];
    } else if (self.animationType == JMBadgeValueAnimationTypeShake) {
        CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
        anima.values = @[@(angle2Rad(-15)),@(angle2Rad(-10)),@(angle2Rad(-7)),@(angle2Rad(-5)),@(angle2Rad(0)),@(angle2Rad(5)),@(angle2Rad(-7)),@(angle2Rad(10)),@(angle2Rad(15))];
        anima.repeatCount = 5.f;
        [self.badgeL.layer addAnimation:anima forKey:@"shake"];
    } else if (self.animationType == JMBadgeValueAnimationTypeOpacity) {
        CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
        anima.fromValue = [NSNumber numberWithFloat:1.0f];
        anima.toValue = [NSNumber numberWithFloat:0.2f];
        anima.repeatCount = 3;
        anima.duration = 0.3;
        anima.autoreverses = YES;
        [self.badgeL.layer addAnimation:anima forKey:@"opacity"];
    }
}

- (CGSize)sizeWithAttribute:(NSString *)text {
    return [text sizeWithAttributes:@{NSFontAttributeName:self.badgeL.font}];
}

@end







