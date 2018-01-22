//
//  JMDefine.h
//  JMButton
//
//  Created by JM on 2018/1/8.
//  Copyright © 2018年 JM. All rights reserved.
//

#ifndef JMDefine_h
#define JMDefine_h

//自定义log
#ifdef DEBUG
#define JMLog(...) NSLog(__VA_ARGS__)
#else
#define JMLog(...)
#endif

//随机颜色+RGB颜色+RBGA颜色+16进制颜色
#define kRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

// 判断是否是iPhone X
#define kiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 状态栏高度
#define kStatusBarHeight (kiPhoneX ? 44.f : 20.f)
// 导航栏高度
#define kNavigationBarHeight (kiPhoneX ? 88.f : 64.f)
// tabBar高度
#define kTabBarHeight (kiPhoneX ? (49.f+34.f) : 49.f)


#endif /* JMDefine_h */
