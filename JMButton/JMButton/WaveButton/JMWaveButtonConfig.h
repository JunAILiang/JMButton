//
//  JMWaveButtonConfig.h
//  JMButton
//
//  Created by JM on 2018/1/23.
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


#import "JMBootstrapButtonConfig.h"

@interface JMWaveButtonConfig : JMBootstrapButtonConfig

//动画时间，默认为1秒
@property (nonatomic, assign) NSTimeInterval AnimationDuration;
//动画颜色 (默认 橙色)
@property (nonatomic, strong) UIColor *highlightedColor;

@end
