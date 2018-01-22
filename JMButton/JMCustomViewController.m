//
//  JMCustomViewController.m
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

#import "JMCustomViewController.h"
#import "JMButtons.h"

@interface JMCustomViewController ()

@end

@implementation JMCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"自定义View";

    
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 280, 100)];
    customView.backgroundColor = [UIColor redColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
    label.text = @"我是的label";
    label.backgroundColor = [UIColor greenColor];
    [customView addSubview:label];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"我是按钮, 点我吧" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blackColor];
    btn.frame = CGRectMake(10, 40, 260, 50);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:btn];
    

    JMButton *customBtn = [[JMButton alloc] initWithFrame:CGRectMake(50, 100, 300, 120) CustomView:customView];
    customBtn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:customBtn];
    
    
//    JMButton *customBtn1 = [JMButton alloc] initWithFrame:CGRectMake(50, 500, 80, 40) CustomView:<#(UIView *)#>
    
    
    
}

- (void)btnClick {
    NSLog(@"我被点击了-.-");
}


@end
