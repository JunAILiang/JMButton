//
//  JMWaveButton.m
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

#import "JMWaveButton.h"
//#import "JMWaveButtonConfig.m"


@interface JMButtonCircleSet : NSObject

@property CGFloat circleCenterX;
@property CGFloat circleCenterY;
@property CGFloat circleWidth;
@property CGFloat circleRait;

@end

@implementation JMButtonCircleSet

@end

@interface JMWaveButton()

@property (nonatomic, assign) int loopCount;
@property (nonatomic, strong) NSMutableDictionary *circles;
@property (nonatomic, assign) int circleFlag;
@property (nonatomic, strong) JMWaveButtonConfig *config;

@end

@implementation JMWaveButton

+ (instancetype)buttonFrame:(CGRect)frame ButtonConfig:(JMWaveButtonConfig *)buttonConfig {
    return [[self alloc] initWithFrame:frame ButtonConfig:buttonConfig];
}

- (instancetype)initWithFrame:(CGRect)frame ButtonConfig:(JMWaveButtonConfig *)buttonConfig {
    if (self = [super initWithFrame:frame ButtonConfig:buttonConfig]) {
        self.config = buttonConfig;

        self.config.AnimationDuration = 1;
        self.loopCount = self.config.AnimationDuration / 0.02;
        
        self.circles = [NSMutableDictionary dictionary];
        self.circleFlag = 0;
        
        [self addTarget:self action:@selector(touchedDown:event:) forControlEvents:UIControlEventTouchDown];
    }
    return self;
}

-(void)touchedDown:(UIButton *)btn event:(UIEvent *)event{
    
    UITouch *touch = event.allTouches.allObjects.firstObject;
    CGPoint touchePoint = [touch locationInView:btn];
    
    NSString *key = [NSString stringWithFormat:@"%d",self.circleFlag];
    JMButtonCircleSet *set = [JMButtonCircleSet new];
    set.circleCenterX = touchePoint.x;
    set.circleCenterY = touchePoint.y;
    set.circleRait = 0;
    
    CGFloat maxX = touchePoint.x>(self.frame.size.width-touchePoint.x)?touchePoint.x:(self.frame.size.width-touchePoint.x);
    CGFloat maxY = touchePoint.y>(self.frame.size.width-touchePoint.y)?touchePoint.y:(self.frame.size.height-touchePoint.y);
    set.circleWidth = maxX>maxY?maxX:maxY;
    
    [self.circles setObject:set forKey:key];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(TimerFunction:)
                                           userInfo:@{@"key":key}
                                            repeats:YES];
    
    [NSRunLoop.mainRunLoop addTimer:timer forMode:NSRunLoopCommonModes];
    
    self.circleFlag++;
}

-(void)TimerFunction:(NSTimer *)timer{
    
    [self setNeedsDisplay];
    
    NSDictionary *userInfo = timer.userInfo;
    
    NSString *key = userInfo[@"key"];
    
    JMButtonCircleSet *set = self.circles[key];
    
    if(set.circleRait<=1){
        
        set.circleRait += (1.0/self.loopCount);
        
    }else{
        [self.circles removeObjectForKey:key];
        
        [timer invalidate];
    }
}

-(void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat endAngle = M_PI * 2;
    
    for (JMButtonCircleSet *circleSet in self.circles.allValues) {
        CGContextAddArc(context,
                        circleSet.circleCenterX,
                        circleSet.circleCenterY,
                        circleSet.circleWidth * circleSet.circleRait,
                        0,
                        endAngle,
                        NO);

        [[self.config.highlightedColor colorWithAlphaComponent:(1-circleSet.circleRait)] setStroke];
        [[self.config.highlightedColor colorWithAlphaComponent:(1-circleSet.circleRait)] setFill];

        CGContextFillPath(context);
    }
}


@end
