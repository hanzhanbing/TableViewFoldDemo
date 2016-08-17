//
//  TableViewCell.h
//  TableViewFoldDemo
//
//  Created by hanzhanbing on 16/8/17.
//  Copyright © 2016年 asj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface TableViewCell : UITableViewCell

@property (nonatomic,retain) UIButton *expandBtn;

- (void)setContentWithModel:(Model *)model; //赋值

@end
