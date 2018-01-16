// 
//  JMRuntime.m
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


#import "JMRuntime.h"

@implementation JMRuntime

/**
 * 打印成员变量列表
 * className  类名称
 */
+ (void)JM_runTimeConsoleMemberListWithClassName:(Class)className {
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList(className, &outCount);
    for (unsigned int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        JMLog(@"类型为 %s 的 %s ",type, name);
    }
    free(ivars);
}

/**
 * 打印属性列表
 * className  类名称
 */
+ (void)JM_runTimeConsolePropertyListWithClassName:(Class)className {
    unsigned int outCount = 0;
    objc_property_t * properties = class_copyPropertyList(className, &outCount);
    for (unsigned int i = 0; i < outCount; i ++) {
        objc_property_t property = properties[i];
        //属性名
        const char * name = property_getName(property);
        //属性描述
        const char * propertyAttr = property_getAttributes(property);
        JMLog(@"属性描述为 %s 的 %s ", propertyAttr, name);
        
        //属性的特性
        unsigned int attrCount = 0;
        objc_property_attribute_t * attrs = property_copyAttributeList(property, &attrCount);
        for (unsigned int j = 0; j < attrCount; j ++) {
            objc_property_attribute_t attr = attrs[j];
            const char * name = attr.name;
            const char * value = attr.value;
            JMLog(@"属性的描述：%s 值：%s", name, value);
        }
        free(attrs);
        JMLog(@"\n");
    }
    free(properties);
}

@end







