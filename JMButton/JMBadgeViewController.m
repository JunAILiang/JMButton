//
//  JMBadgeViewController.m
//  JMButton
//
//  Created by JM on 2018/1/14.
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

#import "JMBadgeViewController.h"
#import "JMButtons.h"

@interface JMBadgeViewController ()

/** sv */
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation JMBadgeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"带角标的样式";
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, self.view.width, self.view.height - kNavigationBarHeight)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.scrollView];
    
    CGFloat W = (self.view.width - 80) / 3;
    CGFloat H = 66;
    NSInteger rank = 3;
    CGFloat rankMargin = (self.view.frame.size.width - rank * W) / (rank );
    CGFloat rowMargin = 20;
    
    CGFloat lastY = 0;
    
    NSMutableArray *temp = [NSMutableArray array];
    for (int i = 0; i < 15; i++) {
        JMBaseButtonConfig *buttonConfig = [JMBaseButtonConfig buttonConfig];
        buttonConfig.backgroundColor = kRandomColor;
        buttonConfig.titleFont = [UIFont systemFontOfSize:20.f];
        if (i >= 0 && i <= 11) {
            buttonConfig.title = [NSString stringWithFormat:@"样式%d",i];
        } else if (i == 12) {
            buttonConfig.titleFont = [UIFont systemFontOfSize:14.f];
            buttonConfig.title = @"自定义样式1";
        } else if (i == 13) {
            buttonConfig.titleFont = [UIFont systemFontOfSize:14.f];
            buttonConfig.title = @"自定义样式2";
        } else if (i == 14) {
            buttonConfig.titleFont = [UIFont systemFontOfSize:14.f];
            buttonConfig.title = @"自定义样式3";
        }
        
        CGFloat X = (i % rank) * (W + rankMargin) + 10;
        NSUInteger Y = (i / rank) * (H +rowMargin);
        
        JMButton *btn = [[JMButton alloc] initWithFrame:CGRectMake(X, Y, W, H) ButtonConfig:buttonConfig];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:btn];
        
        lastY = Y + H;
        
        [temp addObject:btn];
    }
    self.scrollView.contentSize = CGSizeMake(0, lastY);


    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (int i = 0; i < temp.count; i++) {
            JMButton *btn = temp[i];
            if (i == 0) {
                [btn showPointBadgeValue];
            } else if (i == 1) {
                [btn showNewBadgeValue];
            } else if (i == 2) {
                [btn showNumberBadgeValue:@"66"];
            } else if (i == 3) {
                btn.badgeAnimationType = JMBadgeValueAnimationTypeShake;
                [btn showPointBadgeValue];
            } else if (i == 4) {
                btn.badgeAnimationType = JMBadgeValueAnimationTypeShake;
                [btn showNewBadgeValue];
            } else if (i == 5) {
                btn.badgeAnimationType = JMBadgeValueAnimationTypeShake;
                [btn showNumberBadgeValue:@"66"];
            } else if (i == 6) {
                btn.badgeAnimationType = JMBadgeValueAnimationTypeScale;
                [btn showPointBadgeValue];
            } else if (i == 7) {
                btn.badgeAnimationType = JMBadgeValueAnimationTypeScale;
                [btn showNewBadgeValue];
            } else if (i == 8) {
                btn.badgeAnimationType = JMBadgeValueAnimationTypeScale;
                [btn showNumberBadgeValue:@"66"];
            } else if (i == 9) {
                btn.badgeAnimationType = JMBadgeValueAnimationTypeOpacity;
                [btn showPointBadgeValue];
            } else if (i == 10) {
                btn.badgeAnimationType = JMBadgeValueAnimationTypeOpacity;
                [btn showNewBadgeValue];
            } else if (i == 11) {
                btn.badgeAnimationType = JMBadgeValueAnimationTypeOpacity;
                [btn showNumberBadgeValue:@"66"];
            } else if (i == 12) {
                btn.badgeTextColor = [UIColor whiteColor];
                btn.badgeBackgroundColor = [UIColor orangeColor];
                btn.badgeAnimationType = JMBadgeValueAnimationTypeOpacity;
                [btn showNumberBadgeValue:@"66"];
            } else if (i == 13) {
                btn.badgeTextFont = [UIFont systemFontOfSize:16.f];
                btn.badgeSize = CGSizeMake(30, 30);
                btn.badgeOffset = CGPointMake(-20, -10);
                btn.badgeAnimationType = JMBadgeValueAnimationTypeOpacity;
                [btn showNumberBadgeValue:@"77"];
                btn.badgeRadius = 12.f;
            } else if (i == 14) {
                btn.badgeTextFont = [UIFont systemFontOfSize:16.f];
                btn.badgeSize = CGSizeMake(30, 30);
                btn.badgeOffset = CGPointMake(-60, 10);
                btn.badgeAnimationType = JMBadgeValueAnimationTypeOpacity;
                [btn showNumberBadgeValue:@"88"];
                btn.badgeRadius = 15.f;
            }
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [btn showBadgeAnimation];
            });
        }
    });
    

    
}

- (void)btnClick:(JMButton *)sender {
    JMLog(@"点击了第 %zd 个", sender.tag);
}

@end
