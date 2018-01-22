//
//  JMNumberButton.m
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

#import "JMNumberButton.h"
#import "UIColor+JM.h"
#import "UIView+JM.h"

@interface JMNumberButton()

@property (nonatomic, strong) UIButton *decreaseBtn;
@property (nonatomic, strong) UIButton *increaseBtn;
@property (nonatomic, strong) UITextField *textField;
/** 线1 */
@property (nonatomic, strong) UIImageView *line1;
/** 线2 */
@property (nonatomic, strong) UIImageView *line2;
/** config */
@property (nonatomic, strong) JMNumberButtonConfig *config;

@end;

@implementation JMNumberButton

- (instancetype)initWithFrame:(CGRect)frame NumberButtonConfig:(JMNumberButtonConfig *)numberButtonConfig {
    if (self = [super initWithFrame:frame NumberButtonConfig:numberButtonConfig]) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = numberButtonConfig.cornerRadius;
        
        self.config = numberButtonConfig;
        [self setupUI];
        
        if (self.config.borderLineWidth) {
            [self setupLine];
        }
        [self setupStyle];
        
    }
    return self;
}

#pragma mark - 设置样式
- (void)setupStyle {
    if (self.config.numberButtonType == JMNumberButtonTypeNormal) {

    } else if (self.config.numberButtonType == JMNumberButtonTypeTaoBao) {
        self.config.borderLineWidth = 3.f;
        self.config.borderLineColor = [UIColor whiteColor];
        
        [self setupLine];
        
        self.decreaseBtn.backgroundColor = [UIColor colorWithHexString:@"#F4F4F4"];
        self.textField.backgroundColor = [UIColor colorWithHexString:@"#F4F4F4"];
        self.increaseBtn.backgroundColor = [UIColor colorWithHexString:@"#F4F4F4"];
        
        self.layer.borderWidth = 0.f;
    } else if (self.config.numberButtonType == JMNumberButtonTypeJingDong) {
        self.config.borderLineWidth = 1.f;
        self.config.borderLineColor = [UIColor colorWithHexString:@"#888888"];
        
        [self setupLine];
    } else if (self.config.numberButtonType == JMNumberButtonTypeMeiTuan) {
        CGFloat cornerRadius = 0.f;
        if (self.decreaseBtn.width > self.decreaseBtn.height) {
            self.decreaseBtn.width = self.decreaseBtn.height;
            self.increaseBtn.width = self.increaseBtn.height;
            self.decreaseBtn.y = self.height * 0.5 - self.decreaseBtn.height * 0.5;
            self.increaseBtn.y = self.height * 0.5 - self.increaseBtn.height * 0.5;
            self.increaseBtn.x = self.width - self.increaseBtn.width;
            self.decreaseBtn.x = self.increaseBtn.x;
            cornerRadius = self.decreaseBtn.width * 0.5;
        } else if (self.decreaseBtn.height > self.decreaseBtn.width) {
            self.decreaseBtn.height = self.decreaseBtn.width;
            self.increaseBtn.height = self.increaseBtn.width;
            self.decreaseBtn.y = self.height * 0.5 - self.decreaseBtn.height * 0.5;
            self.increaseBtn.y = self.height * 0.5 - self.increaseBtn.height * 0.5;
            self.decreaseBtn.x = self.increaseBtn.x;
            cornerRadius = self.decreaseBtn.height * 0.5;
        }

        self.decreaseBtn.layer.cornerRadius = cornerRadius;
        self.decreaseBtn.layer.masksToBounds = YES;
        self.increaseBtn.layer.cornerRadius = cornerRadius;
        self.increaseBtn.layer.masksToBounds = YES;
        
        self.decreaseBtn.backgroundColor = [UIColor whiteColor];
        self.decreaseBtn.layer.borderColor = [UIColor colorWithHexString:@"#3c8dbc"].CGColor;
        self.decreaseBtn.layer.borderWidth = 1.f;
        [self.decreaseBtn setTitleColor:[UIColor colorWithHexString:@"#3c8dbc"] forState:UIControlStateNormal];

        self.increaseBtn.backgroundColor = [UIColor colorWithHexString:@"#3c8dbc"];
        [self.increaseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        self.textField.backgroundColor = [UIColor clearColor];
        self.textField.alpha = 0.f;
    }
}

#pragma mark - 初始化线条
- (void)setupLine {
    [self.line1 removeFromSuperview];
    [self.line2 removeFromSuperview];
    
    self.line1 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.decreaseBtn.frame) - self.config.borderLineWidth * 0.5, 0, self.config.borderLineWidth, self.height)];
    self.line1.backgroundColor = self.config.borderLineColor;
    [self addSubview:self.line1];
    
    self.line2 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.textField.frame) - self.config.borderLineWidth, 0, self.config.borderLineWidth, self.height)];
    self.line2.backgroundColor = self.config.borderLineColor;
    [self addSubview:self.line2];
    
    self.layer.borderColor = self.config.borderLineColor.CGColor;
    self.layer.borderWidth = self.config.borderLineWidth;
}

#pragma mark - 设置UI
- (void)setupUI {
    self.decreaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.decreaseBtn.frame = CGRectMake(0, 0, self.width * 0.3, self.height);
    [self.decreaseBtn setTitle:self.config.decreaseTitle forState:UIControlStateNormal];
    [self.decreaseBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.decreaseBtn.backgroundColor = self.config.decreaseBackgroundColor;
    [self.decreaseBtn setBackgroundImage:self.config.decreaseBackgroundImage forState:UIControlStateNormal];
    self.decreaseBtn.titleLabel.font = self.config.buttonTitleFont;
    self.decreaseBtn.contentEdgeInsets = self.config.decreaseContentEdgeInsets;
    [self.decreaseBtn addTarget:self action:@selector(decreaseBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.decreaseBtn];
    
    self.increaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.increaseBtn.frame = CGRectMake(self.width - self.width * 0.3, 0, self.decreaseBtn.width, self.decreaseBtn.height);
    [self.increaseBtn setTitle:self.config.increaseTitle forState:UIControlStateNormal];
    [self.increaseBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.increaseBtn.backgroundColor = self.config.increaseBackgroundColor;
    [self.increaseBtn setBackgroundImage:self.config.increaseBackgroundImage forState:UIControlStateNormal];
    self.increaseBtn.titleLabel.font = self.config.buttonTitleFont;
    self.increaseBtn.contentEdgeInsets = self.config.increaseContentEdgeInsets;
    [self.increaseBtn addTarget:self action:@selector(increaseBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.increaseBtn];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(self.width * 0.3, 0, self.width * 0.4, self.height)];
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.textField.font = self.config.inputFont;
    self.textField.text = [NSString stringWithFormat:@"%zd",self.config.currentNumber];
    self.textField.textAlignment = NSTextAlignmentCenter;
    self.textField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.textField.backgroundColor = [UIColor whiteColor];
    [self.textField addTarget:self action:@selector(textFieldValueChange:) forControlEvents:UIControlEventEditingChanged];
    self.textField.enabled = self.config.isInput;
    [self addSubview:self.textField];
}

#pragma mark - 减号按钮事件
- (void)decreaseBtnClick {
    NSInteger curValue = [self.textField.text integerValue];
    curValue--;
    if (curValue < self.config.minNumber) {
        curValue++;
        if (self.config.shakeAnimation) {
            [self shakeAnimation];
        }
    }
    self.textField.text = [NSString stringWithFormat:@"%zd",curValue];
    if ([self.delegate respondsToSelector:@selector(numberButton:Number:)]) {
        [self.delegate numberButton:self Number:curValue];
    }
}

#pragma mark - 加号按钮事件
- (void)increaseBtnClick {
    if (self.textField.alpha == 0) {
        [self rotationAnimation];
        [UIView animateWithDuration:.3f animations:^{
            self.decreaseBtn.x = 0;
            self.textField.alpha = 0.2f;
            [UIView animateWithDuration:.3f animations:^{
                self.textField.alpha = 1.f;
            }];
        }];

        return;
    }
    
    NSInteger curValue = [self.textField.text integerValue];
    curValue++;
    if (curValue > self.config.maxNumber) {
        curValue--;
        if (self.config.shakeAnimation) {
            [self shakeAnimation];
        }
    }
    self.textField.text = [NSString stringWithFormat:@"%zd",curValue];
    if ([self.delegate respondsToSelector:@selector(numberButton:Number:)]) {
        [self.delegate numberButton:self Number:curValue];
    }
}

#pragma mark - 输入框的值改变
- (void)textFieldValueChange:(UITextField *)tf {
    if ([tf.text isEqualToString:@""]) {
        tf.text = [NSString stringWithFormat:@"%zd",self.config.minNumber];
    }
    
    if ([[tf.text substringToIndex:1] isEqualToString:@"0"] && tf.text.length > 1) {
        tf.text = [tf.text substringWithRange:NSMakeRange(1, tf.text.length - 1)];
    }
    
    if ([tf.text integerValue] > self.config.maxNumber) {
        tf.text = [NSString stringWithFormat:@"%zd",self.config.maxNumber];
    }
    
    if ([self.delegate respondsToSelector:@selector(numberButton:Number:)]) {
        [self.delegate numberButton:self Number:[tf.text integerValue]];
    }
}

#pragma mark - 核心动画
// 抖动动画
- (void)shakeAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    CGFloat positionX = self.layer.position.x;
    animation.values = @[@(positionX-10),@(positionX),@(positionX+10)];
    animation.repeatCount = 3;
    animation.duration = 0.07;
    animation.autoreverses = YES;
    [self.layer addAnimation:animation forKey:nil];
}

// 旋转动画
- (void)rotationAnimation
{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.toValue = @(M_PI*2);
    rotationAnimation.repeatCount = 2;
    rotationAnimation.duration = 0.3f;
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.removedOnCompletion = NO;
    [self.decreaseBtn.layer addAnimation:rotationAnimation forKey:nil];
    
    
    CABasicAnimation *rotationAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation1.toValue = @(M_PI*2);
    rotationAnimation1.duration = 0.3f;
    rotationAnimation1.fillMode = kCAFillModeForwards;
    rotationAnimation1.removedOnCompletion = NO;
    [self.increaseBtn.layer addAnimation:rotationAnimation1 forKey:nil];
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    anima.fromValue = [NSNumber numberWithFloat:0.1f];
    anima.toValue = [NSNumber numberWithFloat:0];
//    anima.repeatCount = 1;
    anima.duration = 0.3f;
    anima.autoreverses = YES;
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    [self.textField.layer addAnimation:anima forKey:@"opacity"];
}


@end
















