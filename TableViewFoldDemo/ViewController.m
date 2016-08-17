//
//  ViewController.m
//  TableViewFoldDemo
//
//  Created by hanzhanbing on 16/8/17.
//  Copyright © 2016年 asj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化model
    _dataArray = [NSMutableArray array];
    for (int i = 0; i<10; i++) {
        Model *model = [[Model alloc] init];
        model.isHide = YES; //全部初始为隐藏状态
        [_dataArray addObject:model];
    }
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

#pragma mark - UITableViewDelegate、UITableViewDataSource代理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    Model *model = self.dataArray[indexPath.row];
    if (model.isHide) {
        return 50;
    } else {
        return 150;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"cellInfo";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        cell.backgroundColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    Model *model = self.dataArray[indexPath.row];
    
    [cell setContentWithModel:model]; //赋值
    
    cell.expandBtn.tag = 1000+indexPath.row;
    [cell.expandBtn addTarget:self action:@selector(showAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

#pragma mark - methods 

- (void)showAction:(UIButton *)btn {
    NSInteger index = btn.tag-1000;
    NSLog(@"选中第%ld个",(long)index);
    
    //改变数据源
    for (int i = 0; i<_dataArray.count; i++) {
        Model *model = _dataArray[i];
        if (i==index) {
            model.isHide = !model.isHide;
        } else {
            model.isHide = YES;
        }
    }
    
    //刷新tableView
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
