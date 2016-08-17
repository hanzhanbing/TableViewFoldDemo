//
//  ViewController.h
//  TableViewFoldDemo
//
//  Created by hanzhanbing on 16/8/17.
//  Copyright © 2016年 asj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
#import "Model.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic,retain) NSMutableArray *dataArray;

@end

