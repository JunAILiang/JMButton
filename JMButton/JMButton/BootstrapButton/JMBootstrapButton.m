//
//  JMBootstrapButton.m
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

#import "JMBootstrapButton.h"
#import "JMBootstrapButtonConfig.h"
#import "UIColor+JM.h"

@implementation JMBootstrapButton

+ (instancetype)buttonFrame:(CGRect)frame ButtonConfig:(JMBootstrapButtonConfig *)buttonConfig {
    return [[self alloc] initWithFrame:frame ButtonConfig:buttonConfig];
}

- (instancetype)initWithFrame:(CGRect)frame ButtonConfig:(JMBootstrapButtonConfig *)buttonConfig {
    if (self = [super initWithFrame:frame ButtonConfig:buttonConfig]) {
        if (buttonConfig.bootstrapType == JMBootstrapTypeDefault) {
            [self backgroundColor:[UIColor colorWithHexString:@"#f4f4f4"] CornerRadius:3.f BorderWidth:1.f BorderColor:[UIColor colorWithHexString:@"#dddddd"] TitleColor:[UIColor colorWithHexString:@"#444444"]];
        } else if (buttonConfig.bootstrapType == JMBootstrapTypePrimary) {
            [self backgroundColor:[UIColor colorWithHexString:@"#3c8dbc"] CornerRadius:3.f BorderWidth:1.f BorderColor:[UIColor colorWithHexString:@"#367fa9"] TitleColor:[UIColor whiteColor]];
        } else if (buttonConfig.bootstrapType == JMBootstrapTypeSuccess) {
            [self backgroundColor:[UIColor colorWithHexString:@"#00a65a"] CornerRadius:3.f BorderWidth:1.f BorderColor:[UIColor colorWithHexString:@"#008d4c"] TitleColor:[UIColor whiteColor]];
        } else if (buttonConfig.bootstrapType == JMBootstrapTypeInfo) {
            [self backgroundColor:[UIColor colorWithHexString:@"#00c0ef"] CornerRadius:3.f BorderWidth:1.f BorderColor:[UIColor colorWithHexString:@"#00acd6"] TitleColor:[UIColor whiteColor]];
        } else if (buttonConfig.bootstrapType == JMBootstrapTypeDanger) {
            [self backgroundColor:[UIColor colorWithHexString:@"#dd4b39"] CornerRadius:3.f BorderWidth:1.f BorderColor:[UIColor colorWithHexString:@"#d73925"] TitleColor:[UIColor whiteColor]];
        } else if (buttonConfig.bootstrapType == JMBootstrapTypeWarning) {
            [self backgroundColor:[UIColor colorWithHexString:@"#f39c12"] CornerRadius:3.f BorderWidth:1.f BorderColor:[UIColor colorWithHexString:@"#e08e0b"] TitleColor:[UIColor whiteColor]];
        } else if (buttonConfig.bootstrapType == JMBootstrapTypeMaroon) {
            [self backgroundColor:[UIColor colorWithHexString:@"#f93c81"] CornerRadius:3.f BorderWidth:1.f BorderColor:[UIColor colorWithHexString:@"#d81b60"] TitleColor:[UIColor whiteColor]];
        } else if (buttonConfig.bootstrapType == JMBootstrapTypePurple) {
            [self backgroundColor:[UIColor colorWithHexString:@"#7470bc"] CornerRadius:3.f BorderWidth:1.f BorderColor:[UIColor colorWithHexString:@"#605ca8"] TitleColor:[UIColor whiteColor]];
        } else if (buttonConfig.bootstrapType == JMBootstrapTypeNavy) {
            [self backgroundColor:[UIColor colorWithHexString:@"#163455"] CornerRadius:3.f BorderWidth:1.f BorderColor:[UIColor colorWithHexString:@"#0C2A4B"] TitleColor:[UIColor whiteColor]];
        } else if (buttonConfig.bootstrapType == JMBootstrapTypeOlive) {
            [self backgroundColor:[UIColor colorWithHexString:@"#4ba77e"] CornerRadius:3.f BorderWidth:1.f BorderColor:[UIColor colorWithHexString:@"#419d74"] TitleColor:[UIColor whiteColor]];
        } else if (buttonConfig.bootstrapType == JMBootstrapTypeOrange) {
            [self backgroundColor:[UIColor colorWithHexString:@"#ff9d33"] CornerRadius:3.f BorderWidth:1.f BorderColor:[UIColor colorWithHexString:@"#ff9127"] TitleColor:[UIColor whiteColor]];
        }
    }
    return self;
}

- (void)backgroundColor:(UIColor *)backgroudColor CornerRadius:(CGFloat)cornerRadius BorderWidth:(CGFloat)borderWidth BorderColor:(UIColor *)borderColor TitleColor:(UIColor *)titleColor {
    self.backgroundColor = backgroudColor;
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
    [self setTitleColor:titleColor forState:UIControlStateNormal];
}

@end
