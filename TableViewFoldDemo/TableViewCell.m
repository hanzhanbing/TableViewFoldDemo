//
//  TableViewCell.m
//  TableViewFoldDemo
//
//  Created by hanzhanbing on 16/8/17.
//  Copyright © 2016年 asj. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()
{
    UIView *_hideView;
}
@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
        topView.backgroundColor = [UIColor whiteColor];
        [self addSubview:topView];
        
        _expandBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width-40, 19, 20, 12)];
        [topView addSubview:_expandBtn];
        
        //隐藏视图
        _hideView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame), self.frame.size.width, 100)];
        _hideView.backgroundColor = [UIColor redColor];
        _hideView.hidden = YES;
        [self addSubview:_hideView];
    }
    return self;
}

- (void)setContentWithModel:(Model *)model {

    if (model.isHide) {
        _hideView.hidden = YES;
        [_expandBtn setBackgroundImage:[UIImage imageNamed:@"下拉箭头"] forState:UIControlStateNormal];
    } else {
        _hideView.hidden = NO;
        [_expandBtn setBackgroundImage:[UIImage imageNamed:@"上拉箭头"] forState:UIControlStateNormal];
    }
}

@end
