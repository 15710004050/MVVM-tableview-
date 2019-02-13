//
//  ViewController.m
//  MVVMTableView
//
//  Created by piaoguanjia123 on 2019/2/13.
//  Copyright © 2019 piaoguanjia123. All rights reserved.
//

#import "ViewController.h"
#import "TableDataSource.h"
#import "TableModel.h"
#import "TableRefresh.h"

@interface ViewController ()<TableRefreshDelegate>
@property (nonatomic,strong) TableDataSource *dataSource;
@property (nonatomic,strong) TableModel *tableModel;
@property (nonatomic,strong) TableRefresh *tableRefresh;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView * table =[[UITableView alloc]initWithFrame:UIScreen.mainScreen.bounds style:(UITableViewStylePlain)];
    [self.view addSubview:table];
    //把dataSource的方法封装到TableDataSource类里，通过回调来获取
    self.dataSource = [[TableDataSource alloc]initWithIdentifier:@"cell" array:nil block:^(UITableViewCell* cell, id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",model];
    }];
    
    [self.dataSource setCellDidSelectBlock:^(id model, NSIndexPath *indexPath) {
        NSLog(@"点击了--%@",model);
    }];
    
    //封装下拉刷新和下拉加载更多
    __weak typeof(self)weakself = self;
    TableRefresh * refresh = [[TableRefresh alloc]initWithTableView:table];
    [refresh setLoadNewBlock:^{
        weakself.tableModel = [[TableModel alloc]initWithLoadNewDataBlock:^(NSMutableArray * _Nonnull data, NSInteger loadIndex) {
            NSLog(@"%lu----%ld",(unsigned long)data.count,(long)loadIndex);
            weakself.dataSource.dataArray = data;
            dispatch_async(dispatch_get_main_queue(), ^{
                [table reloadData];
            });
            //加载成功之后通知refrsh结束刷新
            if ([refresh.delegate respondsToSelector:@selector(endRefresh)]) {
                [refresh.delegate endRefresh];
            }
        }];
        
    }];
    
    //加载更多数据
    [refresh setLoadMoreBlock:^{
        [weakself.tableModel loadMoreData:^(NSMutableArray * _Nonnull data, NSInteger loadIndex) {
            NSLog(@"加载更多%lu----%ld",(unsigned long)data.count,(long)loadIndex);
            if (data.count > [weakself.dataSource.dataArray count]) {
                weakself.dataSource.dataArray = data;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [table reloadData];
                });
                //加载成功之后通知refrsh结束刷新
                if ([refresh.delegate respondsToSelector:@selector(endRefresh)]) {
                    [refresh.delegate endRefresh];
                }
            }
        }];
    }];
    [table.mj_header beginRefreshing];
    [table registerClass:[UITableViewCell class]forCellReuseIdentifier:@"cell"];
    table.dataSource = self.dataSource;
    table.delegate = self.dataSource;//因为代理方法也封装到dataSource里，可以根据需要设置
}


@end
