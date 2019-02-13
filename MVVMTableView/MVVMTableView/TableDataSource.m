//
//  DataSource.m
//  MVVMTableView
//
//  Created by piaoguanjia123 on 2019/2/13.
//  Copyright © 2019 piaoguanjia123. All rights reserved.
//

#import "TableDataSource.h"
@interface TableDataSource ()
@property (nonatomic,copy) NSArray *array;
@property (nonatomic,copy) NSString *identifier;
@property (nonatomic, copy) cellConfigureBlock acellConfigureBlock;

@end
@implementation TableDataSource

- (id)initWithIdentifier:(NSString *)identifier array:(NSArray *)array block:(cellConfigureBlock)block{
    if (self == [super init]) {
        self.array = array;
        self.identifier = identifier;
        self.acellConfigureBlock = block;
        
    }return self;
}

- (void)setDataArray:(id)dataArray{
    self.array = dataArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array == nil ? 0: self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:self.identifier forIndexPath:indexPath];
    id model = [self modelsAtIndexPath:indexPath];
    self.acellConfigureBlock(cell, model, indexPath);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = [self modelsAtIndexPath:indexPath];
    self.cellDidSelectBlock(model, indexPath);
}

-(id)modelsAtIndexPath:(NSIndexPath*)path{
    id model = self.array[path.row];
    return model;
}

@end
