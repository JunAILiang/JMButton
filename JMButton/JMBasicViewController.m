//
//  JMBasicViewController.m
//  JMButton
//
//  Created by JM on 2018/1/10.
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

#import "JMBasicViewController.h"
#import "JMButtons.h"

@interface JMBasicViewController ()

/** sv */
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation JMBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"按钮基本样式";
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, self.view.width, self.view.height - kNavigationBarHeight)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.scrollView];

    
    CGFloat W = (self.view.width - 20) / 3;
    CGFloat H = 60;
    NSInteger rank = 3;
    CGFloat rankMargin = (self.view.frame.size.width - rank * W) / (rank - 1);
    CGFloat rowMargin = 10;
    
    CGFloat lastY = 0;
    
    for (int i = 0; i < 19; i++) {
        JMBaseButtonConfig *buttonConfig = [JMBaseButtonConfig buttonConfig];
        buttonConfig.backgroundColor = kRandomColor;
        if (i == 0) {
            buttonConfig.title = @"样式1";
        } else if (i == 1) {
            buttonConfig.title = @"字体大小";
            buttonConfig.titleFont = [UIFont systemFontOfSize:22.f];
        } else if (i == 2) {
            buttonConfig.title = @"字体位置";
            buttonConfig.titleOrigin = CGPointMake(5, 20);
        } else if (i == 3) {
            buttonConfig.image = [UIImage imageNamed:@"icon"];
        } else if (i == 4) {
            buttonConfig.image = [UIImage imageNamed:@"icon"];
            buttonConfig.imageOrigin = CGPointMake(10, 10);
        } else if (i == 5) {
            buttonConfig.image = [UIImage imageNamed:@"icon"];
            buttonConfig.imageSize = CGSizeMake(55, 55);
        } else if (i == 6) {
            buttonConfig.title = @"系统默认";
            buttonConfig.image = [UIImage imageNamed:@"icon"];
        } else if (i == 7) {
            buttonConfig.title = @"间距";
            buttonConfig.image = [UIImage imageNamed:@"icon"];
            buttonConfig.padding = 26;
        } else if (i == 8) {
            buttonConfig.title = @"图片在左";
            buttonConfig.image = [UIImage imageNamed:@"icon"];
            buttonConfig.styleType = JMButtonStyleTypeLeft;
        } else if (i == 9) {
            buttonConfig.title = @"图片在右";
            buttonConfig.image = [UIImage imageNamed:@"icon"];
            buttonConfig.styleType = JMButtonStyleTypeRight;
        } else if (i == 10) {
            buttonConfig.title = @"图片在上";
            buttonConfig.image = [UIImage imageNamed:@"icon"];
            buttonConfig.styleType = JMButtonStyleTypeTop;
        } else if (i == 11) {
            buttonConfig.title = @"图片在下";
            buttonConfig.image = [UIImage imageNamed:@"icon"];
            buttonConfig.styleType = JMButtonStyleTypeBottom;
        } else if (i == 12) {
            buttonConfig.title = @"我有圆角";
            buttonConfig.titleFont = [UIFont systemFontOfSize:22];
            buttonConfig.cornerRadius = 20.f;
        } else if (i == 13) {
            buttonConfig.title = @"左上圆角";
            buttonConfig.titleFont = [UIFont systemFontOfSize:22];
            buttonConfig.cornerRadius = 20.f;
            buttonConfig.corners = UIRectCornerTopLeft;
        } else if (i == 14) {
            buttonConfig.title = @"右上圆角";
            buttonConfig.titleFont = [UIFont systemFontOfSize:22];
            buttonConfig.cornerRadius = 20.f;
            buttonConfig.corners = UIRectCornerTopRight;
        } else if (i == 15) {
            buttonConfig.title = @"左上右下圆角";
            buttonConfig.cornerRadius = 20.f;
            buttonConfig.corners = UIRectCornerTopLeft | UIRectCornerBottomRight;
        } else if (i == 16) {
            buttonConfig.title = @"我有三个圆角";
            buttonConfig.cornerRadius = 20.f;
            buttonConfig.corners = UIRectCornerTopLeft | UIRectCornerBottomRight | UIRectCornerBottomLeft;
        } else if (i == 17) {
            buttonConfig.title = @"我是有边框的";
            buttonConfig.cornerRadius = 20.f;
            buttonConfig.corners = UIRectCornerTopLeft | UIRectCornerBottomRight;
            buttonConfig.borderColor = [UIColor blueColor];
            buttonConfig.borderWidth = 6.f;
        } else if (i == 18) {
            buttonConfig.title = @"我是有边框的";
            buttonConfig.borderColor = [UIColor orangeColor];
            buttonConfig.borderWidth = 5.f;
            buttonConfig.cornerRadius = 20.f;
            buttonConfig.backgroundColor = [UIColor whiteColor];
            buttonConfig.titleColor = [UIColor redColor];
        }
        
        CGFloat X = (i % rank) * (W + rankMargin);
        NSUInteger Y = (i / rank) * (H +rowMargin);
        
        JMButton *btn = [[JMButton alloc] initWithFrame:CGRectMake(X, Y, W, H) ButtonConfig:buttonConfig];
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





