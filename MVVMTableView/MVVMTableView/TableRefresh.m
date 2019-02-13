//
//  TableRefresh.m
//  tableView
//
//  Created by piaoguanjia123 on 2019/1/23.
//  Copyright © 2019 piaoguanjia123. All rights reserved.
//

#import "TableRefresh.h"

@interface TableRefresh ()

@property (nonatomic,strong) UITableView *tableView;
@end

@implementation TableRefresh
//
- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self) {
        self.tableView = tableView;
        self.delegate = self;
        
        tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.loadNewBlock();
        }];
        tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            self.loadMoreBlock();
        }];
    }
    return self;
}



- (void)endRefresh{
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_header endRefreshing];
}

-(void)endRefreshingWithNoMoreData{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
}
@end
