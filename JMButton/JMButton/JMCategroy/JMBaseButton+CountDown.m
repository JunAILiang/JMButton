//
//  JMBaseButton+CountDown.m
//  JMButton
//
//  Created by JM on 2018/1/17.
//  Copyright © 2018年 JM. All rights reserved.
//

#import "JMBaseButton+CountDown.h"
#import <objc/runtime.h>

static NSInteger times;
static NSString *curTitle;
static NSTimer *timer;
static NSString *details;

static const void *cdbKey = @"cdbKey";
static const void *cddbKey = @"cddbKey";
static const void *cdbwKey = @"cdbwKey";
static const void *cddbwKey = @"cddbwKey";

@implementation JMBaseButton (CountDown)

- (UIColor *)countDownBackground {
    return objc_getAssociatedObject(self, cdbKey);
}
- (void)setCountDownBackground:(UIColor *)countDownBackground {
    objc_setAssociatedObject(self, cdbKey, countDownBackground, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (UIColor *)countDownDoneBackground {
    return objc_getAssociatedObject(self, cddbKey);
}
- (void)setCountDownDoneBackground:(UIColor *)countDownDoneBackground{
    objc_setAssociatedObject(self, cddbKey, countDownDoneBackground, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (UIColor *)countDownBorderColor {
    return objc_getAssociatedObject(self, cdbwKey);
}
- (void)setCountDownBorderColor:(UIColor *)countDownBorderColor {
    objc_setAssociatedObject(self, cdbwKey, countDownBorderColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (UIColor *)countDownDoneBorderColor {
    return objc_getAssociatedObject(self, cddbwKey);
}
- (void)setCountDownDoneBorderColor:(UIColor *)countDownDoneBorderColor {
    objc_setAssociatedObject(self, cddbwKey, countDownDoneBorderColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}



- (void)startCountDown:(NSInteger)time {
    times = time;
    curTitle = self.currentTitle;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(startTime) userInfo:nil repeats:YES];
}

- (void)startCountDown:(NSInteger)time Detail:(NSString *)detail {
    details = detail;
    [self startCountDown:time];
}

- (void)startTime {
    if (times == 0) {
        self.userInteractionEnabled = YES;
        [self setTitle:curTitle forState:UIControlStateNormal];
        self.backgroundColor = self.countDownDoneBackground ? self.countDownDoneBackground : self.backgroundColor;
        self.layer.borderColor = self.countDownDoneBorderColor ? self.countDownDoneBorderColor.CGColor : self.layer.borderColor;
        [timer invalidate];
    } else {
        self.userInteractionEnabled = NO;
        self.backgroundColor = self.countDownBackground ? self.countDownBackground : self.backgroundColor;
        self.layer.borderColor = self.countDownBorderColor ? self.countDownBorderColor.CGColor : self.layer.borderColor;
        if (details) {
            [self setTitle:[NSString stringWithFormat:@"%zd%@",times, details] forState:UIControlStateNormal];
        } else {
            [self setTitle:[NSString stringWithFormat:@"%zd秒重新获取",times] forState:UIControlStateNormal];
        }
    }
    times--;

}



@end
