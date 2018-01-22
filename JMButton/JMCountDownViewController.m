//
//  JMCountDownViewController.m
//  JMButton
//
//  Created by JM on 2018/1/17.
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

#import "JMCountDownViewController.h"
#import "JMButtons.h"

@interface JMCountDownViewController ()

/** sv */
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation JMCountDownViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"按钮倒计时功能";
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, self.view.width, self.view.height - kNavigationBarHeight)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.scrollView];
    
    
    CGFloat W = (self.view.width - 60) / 3;
    CGFloat H = 60;
    NSInteger rank = 3;
    CGFloat rankMargin = (self.view.frame.size.width - rank * W) / (rank);
    CGFloat rowMargin = 10;
    
    CGFloat lastY = 0;
    
    for (int i = 0; i < 1; i++) {
        JMBootstrapButtonConfig *buttonConfig = [JMBootstrapButtonConfig buttonConfig];
        if (i == 0) {
            buttonConfig.title = @"Info";
            buttonConfig.bootstrapType = JMBootstrapTypeInfo;
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
    
    //开始倒计时核心代码
    JMBootstrapButton *bsBtn = (JMBootstrapButton*)sender;
    [bsBtn startCountDown:6];
//    [bsBtn startCountDown:5 Detail:@"哈哈"];
//    bsBtn.countDownBackground = [UIColor redColor];
//    bsBtn.countDownBorderColor = [UIColor blueColor];
//    bsBtn.countDownDoneBackground = [UIColor orangeColor];
//    bsBtn.countDownDoneBorderColor = [UIColor greenColor];
}

@end
