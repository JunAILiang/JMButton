//
//  ViewController.m
//  JMButton
//
//  Created by JM on 2018/1/8.
//  Copyright © 2018年 JM. All rights reserved.
//

#import "ViewController.h"
#import "JMButton.h"
#import "JMDefine.h"
#import "JMBasicViewController.h"
#import "JMBadgeViewController.h"
#import "JMBootstrapViewController.h"
#import "JMCountDownViewController.h"
#import "JMCustomViewController.h"
#import "JMNumberViewController.h"
#import "JMWaveViewController.h"
#import "JMRadioViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

/** tableView */
@property (nonatomic, strong) UITableView *tableView;
/** dataArr */
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.dataArr = [NSMutableArray arrayWithObjects:@"系统默认样式",@"带角标的样式",@"Bootstrap样式",@"倒计时按钮功能",@"自定义View",@"高度自定制计数器按钮",@"按钮水波点击效果",@"Radio按钮", nil];
    
    [self.view addSubview:self.tableView];
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        JMBasicViewController *basicVC = [[JMBasicViewController alloc] init];
        [self.navigationController pushViewController:basicVC animated:YES];
    } else if (indexPath.row == 1) {
        JMBadgeViewController *badgeVC = [[JMBadgeViewController alloc] init];
        [self.navigationController pushViewController:badgeVC animated:YES];
    } else if (indexPath.row == 2) {
        JMBootstrapViewController *bootstrapVC = [[JMBootstrapViewController alloc] init];
        [self.navigationController pushViewController:bootstrapVC animated:YES];
    } else if (indexPath.row == 3) {
        JMCountDownViewController *countDownVC = [[JMCountDownViewController alloc] init];
        [self.navigationController pushViewController:countDownVC animated:YES];
    } else if (indexPath.row == 4) {
        JMCustomViewController *customVC = [[JMCustomViewController alloc] init];
        [self.navigationController pushViewController:customVC animated:YES];
    } else if (indexPath.row == 5) {
        JMNumberViewController *numberVC = [[JMNumberViewController alloc] init];
        [self.navigationController pushViewController:numberVC animated:YES];
    } else if (indexPath.row == 6) {
        JMWaveViewController *waveVC = [[JMWaveViewController alloc] init];
        [self.navigationController pushViewController:waveVC animated:YES];
    } else if (indexPath.row == 7) {
        JMRadioViewController *radioVC = [[JMRadioViewController alloc] init];
        [self.navigationController pushViewController:radioVC animated:YES];
    }
}


@end
