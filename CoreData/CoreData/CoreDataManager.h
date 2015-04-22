//
//  CoreDataManager.h
//  CoreData
//
//  Created by Jone ji on 15/4/21.
//  Copyright (c) 2015年 Jone ji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#define ManagerObjectModelFileName @"UserModel"

@interface CoreDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *perStoreCoordinator;

+ (instancetype) sharedCoreDataManager;

- (void)saveContext;

@end
