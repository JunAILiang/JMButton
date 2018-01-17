//
//  JMBaseButton.m
//  JMButton
//
//  Created by JM on 2018/1/10.
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

#import "JMBaseButton.h"
#import "UIView+JM.h"

@interface JMBaseButton()

/** buttonConifig */
@property (nonatomic, strong) JMBaseButtonConfig *buttonConfig;

@end

@implementation JMBaseButton

+ (instancetype)buttonFrame:(CGRect)frame ButtonConfig:(JMBaseButtonConfig *)buttonConfig {
    return [[self alloc] initWithFrame:frame ButtonConfig:buttonConfig];
}

- (instancetype)initWithFrame:(CGRect)frame ButtonConfig:(JMBaseButtonConfig *)buttonConfig {
    if (self = [super initWithFrame:frame]) {
        self.buttonConfig = buttonConfig;
        [self setTitle:buttonConfig.title forState:UIControlStateNormal];
        [self setImage:buttonConfig.image forState:UIControlStateNormal];
        [self setTitleColor:buttonConfig.titleColor forState:UIControlStateNormal];
        [self setBackgroundColor:buttonConfig.backgroundColor];
        [self setBackgroundImage:buttonConfig.backgroundImage forState:UIControlStateNormal];
        self.titleLabel.font = buttonConfig.titleFont;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat centerX = self.width * 0.5;
    CGFloat centerY = self.height * 0.5;
    CGFloat padding = self.buttonConfig.padding * 0.5;
    
    //先改Size和中心点, 否则会有位置显示问题
    if (self.buttonConfig.imageSize.width !=0 && self.buttonConfig.imageSize.height != 0) {
        self.imageView.y = centerY - self.buttonConfig.imageSize.height * 0.5;
        self.imageView.size = self.buttonConfig.imageSize;
    }
    
    CGFloat allWidth = self.imageView.width + self.titleLabel.width;
    CGFloat allHeight = self.imageView.height + self.titleLabel.height;
    
    if (self.buttonConfig.styleType == JMButtonStyleTypeLeft) {
        self.imageView.x = centerX - allWidth * 0.5 - padding;
        self.titleLabel.x = CGRectGetMaxX(self.imageView.frame) + padding * 2;
    } else if (self.buttonConfig.styleType == JMButtonStyleTypeRight) {
        self.titleLabel.x = centerX - allWidth * 0.5 - padding;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + padding * 2;
    } else if (self.buttonConfig.styleType == JMButtonStyleTypeTop) {
        self.imageView.x = centerX - self.imageView.width * 0.5;
        self.imageView.y = centerY - allHeight * 0.5 - padding;
        self.titleLabel.x = centerX - self.titleLabel.width * 0.5;
        self.titleLabel.y = CGRectGetMaxY(self.imageView.frame) + padding * 2;
    } else if (self.buttonConfig.styleType == JMButtonStyleTypeBottom) {
        self.titleLabel.x = centerX - self.titleLabel.width * 0.5;
        self.titleLabel.y = centerY - allHeight * 0.5 - padding;
        self.imageView.x = centerX - self.imageView.width * 0.5;
        self.imageView.y = CGRectGetMaxY(self.titleLabel.frame) + padding * 2;
    }
    
    if (self.buttonConfig.titleOrigin.x != 0 || self.buttonConfig.titleOrigin.y != 0) {
        self.titleLabel.x = self.buttonConfig.titleOrigin.x;
        self.titleLabel.y = self.buttonConfig.titleOrigin.y;
    }
    if (self.buttonConfig.imageOrigin.x != 0 || self.buttonConfig.imageOrigin.y != 0) {
        self.imageView.x = self.buttonConfig.imageOrigin.x;
        self.imageView.y = self.buttonConfig.imageOrigin.y;
    }
}


@end
