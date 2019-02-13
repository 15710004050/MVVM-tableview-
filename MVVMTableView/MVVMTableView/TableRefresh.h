//
//  TableRefresh.h
//  tableView
//
//  Created by piaoguanjia123 on 2019/1/23.
//  Copyright © 2019 piaoguanjia123. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJRefresh.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TableRefreshDelegate <NSObject>

@optional
-(void)endRefresh;
-(void)endRefreshingWithNoMoreData;
@end

@interface TableRefresh : NSObject<TableRefreshDelegate>

@property (nonatomic,weak) id<TableRefreshDelegate> delegate;

@property (nonatomic,copy) void(^loadNewBlock) (void);

@property (nonatomic,copy) void(^loadMoreBlock) (void);

- (instancetype)initWithTableView:(UITableView *)tableView ;
@end

NS_ASSUME_NONNULL_END
