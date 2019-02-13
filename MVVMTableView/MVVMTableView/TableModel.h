//
//  TableModel.h
//  tableView
//
//  Created by piaoguanjia123 on 2019/1/22.
//  Copyright © 2019 piaoguanjia123. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableRefresh.h"

NS_ASSUME_NONNULL_BEGIN



typedef void(^loadNewDataBlock)(NSMutableArray * data,NSInteger loadIndex);

@interface TableModel : NSObject

- (instancetype)initWithLoadNewDataBlock:(loadNewDataBlock)loadNewDataBlock ;

-(void)loadMoreData:(void(^)(NSMutableArray* data,NSInteger loadIndex))loadMoreDataBlock;

@end

NS_ASSUME_NONNULL_END
