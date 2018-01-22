//
//  JMNumberButtonConfig.h
//  JMButton
//
//  Created by JM on 2018/1/18.
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

typedef NS_ENUM(NSInteger, JMNumberButtonType) {
    JMNumberButtonTypeNormal,  //默认样式
    JMNumberButtonTypeTaoBao,  //仿淘宝样式
    JMNumberButtonTypeJingDong, //仿京东样式
    JMNumberButtonTypeMeiTuan,  //仿美团 饿了吗 百度外卖 样式
};

@interface JMNumberButtonConfig : NSObject

/** 初始化 */
+ (instancetype)buttonConfig;

/********************* 样式配置 *********************/
/** 样式 */
@property (nonatomic, assign) JMNumberButtonType numberButtonType;
/** 是否开启抖动动画 (默认 NO) */
@property (nonatomic, assign) BOOL shakeAnimation;


/********************* 输入框配置 *********************/
/** 输入框中的内容 (默认 1) */
@property (nonatomic, assign) NSInteger currentNumber;
/** 输入框中字体大小 (默认 20.f )*/
@property (nonatomic, strong) UIFont *inputFont;
/** 输入框是否可输入 (默认 YES) */
@property (nonatomic, assign) BOOL isInput;
/** 边框线条宽度 (默认 0  0的话不会展示) */
@property (nonatomic, assign) CGFloat borderLineWidth;
/** 边框线条颜色 (默认 #eeeeee) */
@property (nonatomic, strong) UIColor *borderLineColor;
/** 圆角值 ( 默认 3.f  如果设置了numberButtonType, 圆角值将无效 ) */
@property (nonatomic, assign) CGFloat cornerRadius;


/********************* 按钮配置 *********************/
/** 加减按钮字体大小 (默认 30.f) */
@property (nonatomic, strong) UIFont *buttonTitleFont;
/** 加按钮背景颜色 (默认 #FFFFFF) */
@property (nonatomic, strong) UIColor *increaseBackgroundColor;
/** 减按钮背景颜色 (默认 #FFFFFF)*/
@property (nonatomic, strong) UIColor *decreaseBackgroundColor;
/** 加按钮背景图片 (默认 nil  图片的设置优先级高于背景颜色) */
@property (nonatomic, strong) UIImage *increaseBackgroundImage;
/** 减按钮背景图片 (默认 nil) */
@property (nonatomic, strong) UIImage *decreaseBackgroundImage;
/** 加按钮标题 (默认 +) */
@property (nonatomic, strong) NSString *increaseTitle;
/** 减按钮标题 (默认 -) */
@property (nonatomic, strong) NSString *decreaseTitle;
/** 加按钮contentEdgeInsets (默认 0, 0, 3, 0) */
@property (nonatomic, assign) UIEdgeInsets increaseContentEdgeInsets;
/** 减按钮contentEdgeInsets (默认 0, 0, 3, 0) */
@property (nonatomic, assign) UIEdgeInsets decreaseContentEdgeInsets;


/********************* 其他配置 *********************/
/** 最小值 (默认 1)*/
@property (nonatomic, assign) NSInteger minNumber;
/** 最大值 (默认 无限制)*/
@property (nonatomic, assign) NSInteger maxNumber;

@end
