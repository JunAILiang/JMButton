//
//  JMNumberButton.h
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

#import "JMButton.h"
#import "JMBaseButton.h"
@class JMNumberButton;

@protocol JMNumberButtonDelegate<NSObject>

/**
 JMNumberButtonDelegate
 @param numberButton 当前按钮
 @param number 当前的数据
 */
- (void)numberButton:(JMNumberButton *)numberButton Number:(NSInteger)number;

@end

@interface JMNumberButton : JMButton

/** 代理 */
@property (nonatomic, weak) id<JMNumberButtonDelegate> delegate;

@end







