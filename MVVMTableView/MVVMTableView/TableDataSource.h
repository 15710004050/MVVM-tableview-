//
//  DataSource.h
//  MVVMTableView
//
//  Created by piaoguanjia123 on 2019/2/13.
//  Copyright © 2019 piaoguanjia123. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^cellConfigureBlock)(id cell,id model,NSIndexPath * indexPath);

@interface TableDataSource : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) id dataArray;

@property (nonatomic,copy) void(^cellDidSelectBlock) (id model,NSIndexPath * indexPath);

-(id)initWithIdentifier:(NSString *)identifier array:(NSArray*)array block:(cellConfigureBlock)block;

-(id)modelsAtIndexPath:(NSIndexPath*)path;

@end

NS_ASSUME_NONNULL_END
