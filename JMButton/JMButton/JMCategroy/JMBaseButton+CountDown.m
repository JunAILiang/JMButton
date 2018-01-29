//
//  JMBaseButton+CountDown.m
//  JMButton
//
//  Created by JM on 2018/1/17.
//  Copyright © 2018年 JM. All rights reserved.
//

#import "JMBaseButton+CountDown.h"
#import <objc/runtime.h>

static NSString *yasinTempText;
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



- (void)startCountDown:(int)time {
    [self initButtonData];
    
    [self startTime:time];
}

- (void)startCountDown:(int)time Detail:(NSString *)detail {
    details = detail;
    [self startCountDown:time];
}

- (void)initButtonData{
    
    yasinTempText = [NSString stringWithFormat:@"%@",self.titleLabel.text];
    
}

- (void)startTime:(int)time{
    
    __block int timeout = time;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0 * NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(_timer, ^{
        
        //倒计时结束
        if(timeout <= 0){
            
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self setTitle:yasinTempText forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
                
            });
            
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (details) {
                    [self setTitle:[NSString stringWithFormat:@"%02d%@",timeout, details] forState:UIControlStateNormal];
                } else {
                    [self setTitle:[NSString stringWithFormat:@"%02d秒重新获取",timeout] forState:UIControlStateNormal];
                }
                self.userInteractionEnabled = NO;
                
            });
            
            timeout --;
            
        }
        
    });
    
    dispatch_resume(_timer);
    
}

@end
