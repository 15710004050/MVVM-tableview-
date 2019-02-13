//
//  TableModel.m
//  tableView
//
//  Created by piaoguanjia123 on 2019/1/22.
//  Copyright © 2019 piaoguanjia123. All rights reserved.
//

#import "TableModel.h"

@interface TableModel ()
@property (nonatomic,assign) NSInteger loadIndex;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,copy) loadNewDataBlock loadNewDataBlock;

@end

@implementation TableModel
- (instancetype)initWithLoadNewDataBlock:(loadNewDataBlock)loadNewDataBlock
{
    self = [super init];
    if (self) {
        self.loadNewDataBlock = loadNewDataBlock;
         [self loadNewData];
    }
    return self;
}

-(void)loadNewData{
    self.loadIndex = 1;
    //异步加载数据
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //模仿延时获取加载出的数据
        [NSThread sleepForTimeInterval:1];
        NSArray * array = @[@"全部",@"哈哈哈哈哈哈",@"的点点滴滴多多" ,@"他啦啦啦啦啦啦",@"发哈几个",@"鞥UNv",@"麓山国际后悔过",@"lllllldaffff",@"lalalalall",@"啦啦啦啦啦啦",@"喵喵吗喵毛",@"囖囖囖囖大家开发及囖囖咯",@"安安",@"对对对",@"错",@"初音MIKU",@"ANIMENZ哈哈哈哈哈哈哈",@"PENBEAT",@"OP",@"ILEM",@"原创",@"作业用BGM",@"打到车才",@"大卫反反复复",@"BGM",@"LAUNCHPAD",@"全部",@"哈哈哈哈哈哈",@"的点点滴滴多多" ,@"他啦啦啦啦啦啦",@"发哈几个",@"鞥UNv",@"麓山国际后悔过",@"lllllldaffff",@"lalalalall",@"啦啦啦啦啦啦",@"喵喵吗喵毛",@"囖囖囖囖大家开发及囖囖咯",@"安安",@"对对对",@"错",@"初音MIKU",@"ANIMENZ哈哈哈哈哈哈哈",@"PENBEAT",@"OP",@"ILEM",@"原创",@"作业用BGM",@"打到车才",@"大卫反反复复",@"BGM",@"LAUNCHPAD"];
        self.dataArray = [NSMutableArray arrayWithArray:array];
        self.loadNewDataBlock(self.dataArray, self.loadIndex);
    });
}

-(void)loadMoreData:(void(^)(NSMutableArray* data,NSInteger loadIndex))loadMoreDataBlock{
    self.loadIndex ++;
    if (self.loadIndex > 4) {
        loadMoreDataBlock(self.dataArray,self.loadIndex);
        return;
    }else{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [NSThread sleepForTimeInterval:1];
            NSArray * array = @[@"全部",@"哈哈哈哈哈哈",@"的点点滴滴多多" ,@"他啦啦啦啦啦啦",@"发哈几个",@"鞥UNv",@"麓山国际后悔过",@"lllllldaffff",@"lalalalall",@"啦啦啦啦啦啦",@"喵喵吗喵毛",@"囖囖囖囖大家开发及囖囖咯",@"安安",@"对对对",@"错",@"初音MIKU",@"ANIMENZ哈哈哈哈哈哈哈",@"PENBEAT",@"OP",@"ILEM",@"原创",@"作业用BGM",@"打到车才",@"大卫反反复复",@"BGM",@"LAUNCHPAD"];
            [self.dataArray addObjectsFromArray:array];
            loadMoreDataBlock(self.dataArray, self.loadIndex);
        });
    }
    
}


@end
