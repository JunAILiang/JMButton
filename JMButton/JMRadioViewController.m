//
//  JMRadioViewController.m
//  JMButton
//
//  Created by JM on 2018/1/27.
//  Copyright © 2018年 JM. All rights reserved.
//

#import "JMRadioViewController.h"
#import "JMButtons.h"

@interface JMRadioViewController ()

@end

@implementation JMRadioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"radio按钮效果";
    
    JMRadioButton *radiobtn = [[JMRadioButton alloc] initWithFrame:CGRectMake(50, 100, 140, 50)];
    radiobtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:radiobtn];
}

@end
