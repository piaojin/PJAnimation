//
//  ViewController.m
//  PJAnimation
//
//  Created by piaojin on 2017/10/16.
//  Copyright © 2017年 piaojin. All rights reserved.
//

#import "ViewController.h"

static NSString *kIdentifier = @"PJAnimationCell";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray<NSString *> *animationTitles;
@property (nonatomic, copy) NSArray<NSString *> *animationViewControllers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initData];
}

- (void)initView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.tableFooterView = [[UIView alloc] init];
}

- (void)initData {
    _animationTitles = @[@"神奇移动",@"弹性pop",@"翻页效果",@"小圆点扩散"];
    _animationViewControllers = @[@"MoveFromViewController",@"PopFromViewController",@"PageFromViewController",@"DiffusionFromViewController"];
}

#pragma mark - tableView delagte
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _animationTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kIdentifier];
    }
    cell.textLabel.text = _animationTitles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Class class = NSClassFromString(_animationViewControllers[indexPath.row]);
    if (class) {
        [self.navigationController pushViewController:[[class alloc] init] animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
