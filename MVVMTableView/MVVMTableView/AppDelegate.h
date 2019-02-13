//
//  AppDelegate.h
//  MVVMTableView
//
//  Created by piaoguanjia123 on 2019/2/13.
//  Copyright © 2019 piaoguanjia123. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

