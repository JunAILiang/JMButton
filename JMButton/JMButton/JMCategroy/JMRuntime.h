//
//  JMRuntime.h
//  JMTabBarController
//
//  Created by JM on 2017/12/26.
//  Copyright © 2017年 JM. All rights reserved.
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
#import <objc/runtime.h>
#import "JMDefine.h"

@interface JMRuntime : NSObject

/**
 * 打印成员变量列表
 * className  类名称
 */
+ (void)JM_runTimeConsoleMemberListWithClassName:(Class)className;

/**
 * 打印属性列表
 * className  类名称
 */
+ (void)JM_runTimeConsolePropertyListWithClassName:(Class)className;


@end
