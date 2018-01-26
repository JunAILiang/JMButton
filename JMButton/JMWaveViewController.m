//
//  JMWaveViewController.m
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

#import "JMWaveViewController.h"
#import "JMButtons.h"

@interface JMWaveViewController ()

@end

@implementation JMWaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"按钮水波点击效果";
    
    
    JMWaveButtonConfig *buttonConfig = [JMWaveButtonConfig buttonConfig];
    buttonConfig.highlightedColor = [UIColor redColor];
    buttonConfig.bootstrapType = JMBootstrapTypePurple;
    buttonConfig.title = @"我是按钮1";
    JMButton *waveBtn = [[JMButton alloc] initWithFrame:CGRectMake(50, 100, 160, 60) ButtonConfig:buttonConfig];
    [self.view addSubview:waveBtn];
    
    JMWaveButtonConfig *buttonConfig1 = [JMWaveButtonConfig buttonConfig];
    buttonConfig1.bootstrapType = JMBootstrapTypeNone; //水波纹效果一定要把bootstrapType设为None
    buttonConfig1.highlightedColor = [UIColor orangeColor];
    buttonConfig1.backgroundColor = [UIColor colorWithHexString:@"#f93c81"];
    buttonConfig1.title = @"我是按钮2";
    buttonConfig1.cornerRadius = 20.f;
    buttonConfig1.corners = UIRectCornerTopLeft | UIRectCornerBottomRight;
    buttonConfig1.borderColor = [UIColor blueColor];
    buttonConfig1.borderWidth = 6.f;
    JMButton *waveBtn1 = [[JMButton alloc] initWithFrame:CGRectMake(50, 200, 160, 60) ButtonConfig:buttonConfig1];
    [self.view addSubview:waveBtn1];
    
}

@end
