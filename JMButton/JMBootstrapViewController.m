//
//  JMBootstrapViewController.m
//  JMButton
//
//  Created by JM on 2018/1/15.
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

#import "JMBootstrapViewController.h"
#import "JMButtons.h"

@interface JMBootstrapViewController ()

/** sv */
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation JMBootstrapViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Bootstrap样式";
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, self.view.width, self.view.height - kNavigationBarHeight)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.scrollView];
    
    
    CGFloat W = (self.view.width - 60) / 3;
    CGFloat H = 60;
    NSInteger rank = 3;
    CGFloat rankMargin = (self.view.frame.size.width - rank * W) / (rank);
    CGFloat rowMargin = 10;
    
    CGFloat lastY = 0;
    
    for (int i = 0; i < 11; i++) {
        JMBootstrapButtonConfig *buttonConfig = [JMBootstrapButtonConfig buttonConfig];
        buttonConfig.titleFont = [UIFont systemFontOfSize:20.f];
        if (i == 0) {
            buttonConfig.title = @"Default";
            buttonConfig.bootstrapType = JMBootstrapTypeDefault;
        } else if (i == 1) {
            buttonConfig.title = @"Primary";
            buttonConfig.bootstrapType = JMBootstrapTypePrimary;
        } else if (i == 2) {
            buttonConfig.title = @"Success";
            buttonConfig.bootstrapType = JMBootstrapTypeSuccess;
        } else if (i == 3) {
            buttonConfig.title = @"Info";
            buttonConfig.bootstrapType = JMBootstrapTypeInfo;
        } else if (i == 4) {
            buttonConfig.title = @"Danger";
            buttonConfig.bootstrapType = JMBootstrapTypeDanger;
        } else if (i == 5) {
            buttonConfig.title = @"Warning";
            buttonConfig.bootstrapType = JMBootstrapTypeWarning;
        } else if (i == 6) {
            buttonConfig.title = @"Maroon";
            buttonConfig.bootstrapType = JMBootstrapTypeMaroon;
        } else if (i == 7) {
            buttonConfig.title = @"Purple";
            buttonConfig.bootstrapType = JMBootstrapTypePurple;
        } else if (i == 8) {
            buttonConfig.title = @"Navy";
            buttonConfig.bootstrapType = JMBootstrapTypeNavy;
        } else if (i == 9) {
            buttonConfig.title = @"Orange";
            buttonConfig.bootstrapType = JMBootstrapTypeOrange;
        } else if (i == 10) {
            buttonConfig.title = @"Olive";
            buttonConfig.bootstrapType = JMBootstrapTypeOlive;
        }
        
        
        CGFloat X = (i % rank) * (W + rankMargin) + 10;
        NSUInteger Y = (i / rank) * (H +rowMargin);
        
        JMButton *btn = [[JMButton alloc] initWithFrame:CGRectMake(X, Y + 10, W, H) ButtonConfig:buttonConfig];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:btn];
        
        
        lastY = Y + H;
    }
    
    self.scrollView.contentSize = CGSizeMake(0, lastY);
}

- (void)btnClick:(JMButton *)sender {
    JMLog(@"点击了第 %zd 个", sender.tag);
}


@end
