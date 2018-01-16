// 
//  JMBaseButtonConfig.m
//  JMButton
//
//  Created by JM on 2018/1/9.
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


#import "JMBaseButtonConfig.h"

@implementation JMBaseButtonConfig

+ (instancetype)buttonConfig {
    return [[self alloc] init];
}

- (instancetype)init {
    if (self = [super init]) {
        _titleFont = [UIFont systemFontOfSize:14.f];
        _title = @"";
        _titleColor = [UIColor whiteColor];
        _image = [UIImage new];
        _imageSize = CGSizeZero;
        _imageOrigin = CGPointZero;
        _titleOrigin = CGPointZero;
        _corners = UIRectCornerAllCorners;
        _cornerRadius = 0;
        _backgroundColor = [UIColor whiteColor];
        _styleType = JMButtonStyleTypeLeft;
        _padding = 6.f;
        _borderWidth = 0.f;
        _borderColor = [UIColor clearColor];
        _backgroundImage = [UIImage new];
    }
    return self;
}


-(void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
}
- (void)setTitle:(NSString *)title {
    _title = title;
}
- (void)setImage:(UIImage *)image {
    _image = image;
}
- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
}
- (void)setImageSize:(CGSize)imageSize {
    _imageSize = imageSize;
}
- (void)setTitleOrigin:(CGPoint)titleOrigin {
    _titleOrigin = titleOrigin;
}
- (void)setImageOrigin:(CGPoint)imageOrigin {
    _imageOrigin = imageOrigin;
}
- (void)setCorners:(UIRectCorner)corners {
    _corners = corners;
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
}
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _backgroundColor = backgroundColor;
}
- (void)setBackgroundImage:(UIImage *)backgroundImage {
    _backgroundImage = backgroundImage;
}
- (void)setStyleType:(JMButtonStyleType)styleType {
    _styleType = styleType;
}
- (void)setPadding:(CGFloat)padding {
    _padding = padding;
}
- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
}
- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
}

@end
