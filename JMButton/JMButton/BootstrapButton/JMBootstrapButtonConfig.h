//
//  JMBootstrapButtonConfig.h
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


#import "JMBaseButtonConfig.h"

typedef NS_ENUM(NSInteger, JMBootstrapType) {
    JMBootstrapTypeNone, //none
    JMBootstrapTypeDefault, //Default
    JMBootstrapTypePrimary, //Primary
    JMBootstrapTypeSuccess, //Success
    JMBootstrapTypeInfo, //Info
    JMBootstrapTypeDanger, //Danger
    JMBootstrapTypeWarning, //Warning
    JMBootstrapTypeMaroon, //Maroon
    JMBootstrapTypePurple, //Purple
    JMBootstrapTypeNavy, //Navy
    JMBootstrapTypeOrange, //Orange
    JMBootstrapTypeOlive, //Olive
};

@interface JMBootstrapButtonConfig : JMBaseButtonConfig

/** type */
@property (nonatomic, assign) JMBootstrapType bootstrapType;

@end
