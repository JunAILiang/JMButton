// 
//  JMNumberButtonConfig.m
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


#import "JMNumberButtonConfig.h"
#import "UIColor+JM.h"

@implementation JMNumberButtonConfig

- (instancetype)init {
    if (self = [super init]) {
        _currentNumber = 1;
        _minNumber = 1;
        _maxNumber = MAXFLOAT;
        _inputFont = [UIFont systemFontOfSize:20.f];
        _buttonTitleFont = [UIFont systemFontOfSize:30.f];
        _numberButtonType = JMNumberButtonTypeNormal;
        _isInput = YES;
        _increaseTitle = @"+";
        _decreaseTitle = @"-";
        _increaseBackgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
        _decreaseBackgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
        _increaseBackgroundImage = [UIImage new];
        _decreaseBackgroundImage = [UIImage new];
        _borderLineWidth = 0.f;
        _borderLineColor = [UIColor colorWithHexString:@"#eeeeee"];
        _cornerRadius = 3.f;
        _shakeAnimation = NO;
        _increaseContentEdgeInsets = UIEdgeInsetsMake(0, 0, 3, 0);
        _decreaseContentEdgeInsets = UIEdgeInsetsMake(0, 0, 3, 0);
    }
    return self;
}

+ (instancetype)buttonConfig {
    return [[self alloc] init];
}

@end
