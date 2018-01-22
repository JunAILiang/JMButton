//
//  JMNumberViewController.m
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

#import "JMNumberViewController.h"
#import "JMButtons.h"

@interface JMNumberViewController ()<JMNumberButtonDelegate>

@end

@implementation JMNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithHexString:@"#f4f4f4"];
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"高度自定制计数器按钮";
    
    
    //默认样式
    JMNumberButtonConfig *buttonConfig = [JMNumberButtonConfig buttonConfig];
    buttonConfig.shakeAnimation = YES;
    JMNumberButton *numberBtn = [[JMNumberButton alloc] initWithFrame:CGRectMake(50, 100, 120, 40) NumberButtonConfig:buttonConfig];
    [self.view addSubview:numberBtn];
    
    //自定义样式
    JMNumberButtonConfig *buttonConfig1 = [JMNumberButtonConfig buttonConfig];
    buttonConfig1.currentNumber = 2;
    buttonConfig1.minNumber = 0;
    buttonConfig1.maxNumber = 10;
//    buttonConfig1.isInput = NO;
    buttonConfig1.increaseBackgroundColor = [UIColor redColor];
    buttonConfig1.decreaseBackgroundColor = [UIColor greenColor];
    buttonConfig1.borderLineWidth = 2.f;
    buttonConfig1.borderLineColor = [UIColor blueColor];
    JMNumberButton *numberBtn1 = [[JMNumberButton alloc] initWithFrame:CGRectMake(50, 160, 120, 36) NumberButtonConfig:buttonConfig1];
    [self.view addSubview:numberBtn1];
    
    //仿淘宝样式
    JMNumberButtonConfig *buttonConfig2 = [JMNumberButtonConfig buttonConfig];
    buttonConfig2.numberButtonType = JMNumberButtonTypeTaoBao;
    JMNumberButton *numberBtn2 = [[JMNumberButton alloc] initWithFrame:CGRectMake(50, 220, 120, 40) NumberButtonConfig:buttonConfig2];
    [self.view addSubview:numberBtn2];
    
    
    //仿京东样式
    JMNumberButtonConfig *buttonConfig3 = [JMNumberButtonConfig buttonConfig];
    buttonConfig3.numberButtonType = JMNumberButtonTypeJingDong;
    JMNumberButton *numberBtn3 = [[JMNumberButton alloc] initWithFrame:CGRectMake(50, 280, 120, 40) NumberButtonConfig:buttonConfig3];
    [self.view addSubview:numberBtn3];
    
    
    //仿美团 饿了吗 百度外卖样式
    JMNumberButtonConfig *buttonConfig4 = [JMNumberButtonConfig buttonConfig];
    buttonConfig4.numberButtonType = JMNumberButtonTypeMeiTuan;
    JMNumberButton *numberBtn4 = [[JMNumberButton alloc] initWithFrame:CGRectMake(50, 340, 120, 30) NumberButtonConfig:buttonConfig4];
    [self.view addSubview:numberBtn4];
    
    
    //遵守代理
    numberBtn.delegate = self;
    numberBtn1.delegate = self;
    numberBtn2.delegate = self;
    numberBtn3.delegate = self;
    numberBtn4.delegate = self;
}

#pragma mark - JMNumberButtonDelegate
- (void)numberButton:(JMNumberButton *)numberButton Number:(NSInteger)number {
    JMLog(@"%@----%zd",numberButton, number);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
