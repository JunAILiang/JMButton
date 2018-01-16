//
//  JMBaseButtonConfig.h
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


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JMBaseButtonConfig : NSObject

typedef NS_ENUM(NSInteger, JMButtonStyleType) {
    JMButtonStyleTypeTop,  //图片在上, 文字在下
    JMButtonStyleTypeLeft, //图片在左, 文字在右
    JMButtonStyleTypeBottom, //图片在下, 文字在上
    JMButtonStyleTypeRight, //图片在右, 文字在左
};


/** 初始化 */
+ (instancetype)buttonConfig;

/** 按钮类型 (默认图片在左, 文字在右) */
@property (nonatomic, assign) JMButtonStyleType styleType;
/** padding (文字和图片之间的间距, 默认为6.f) */
@property (nonatomic, assign) CGFloat padding;

/************************ 文字相关属性设置 ************************/
/** 文字大小(默认14.f) */
@property (nonatomic, strong) UIFont *titleFont;
/** 文字 (默认为nil) */
@property (nonatomic, copy) NSString *title;
/** 文字颜色(默认白色) */
@property (nonatomic, strong) UIColor *titleColor;
/** 更改文字的origin(无特殊需求,请勿修改此属性, 注意不能设置为0,0) */
@property (nonatomic, assign) CGPoint titleOrigin;


/************************ 图片相关属性设置 ************************/
/** 图片(默认为nil) */
@property (nonatomic, strong) UIImage *image;
/** 图片的大小(无特殊需求, 请勿修改此属性) */
@property (nonatomic, assign) CGSize imageSize;
/** 图片的origin(无特殊需求,请勿修改此属性,注意不能设置为0,0) */
@property (nonatomic, assign) CGPoint imageOrigin;

/************************ 圆角相关属性设置 ************************/
/** 圆角类型 (默认 UIRectCornerAllCorners) */
@property (nonatomic, assign) UIRectCorner corners;
/** 圆角大小 (默认 0) */
@property (nonatomic, assign) CGFloat cornerRadius;

/************************ 背景相关属性设置 ************************/
/** 背景颜色 (默认 白色) */
@property (nonatomic, strong) UIColor *backgroundColor;
/** 背景图片 (默认 无) */
@property (nonatomic, strong) UIImage *backgroundImage;

/************************ 边框相关属性设置 ************************/
/** 边框线条颜色 (默认 clearColor) */
@property (nonatomic, strong) UIColor *borderColor;
/** 边框线条宽度 (默认 0 ) */
@property (nonatomic, assign) CGFloat borderWidth;


@end
