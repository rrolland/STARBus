//
//  CoreDataManager.h
//  STARBus
//
//  Created by Romain Rolland on 23/06/2015.
//  Copyright (c) 2015 romainrolland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

@property (nonatomic,strong) NSManagedObjectContext *moc;

+ (instancetype)sharedManager;
- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)moc;

- (NSArray *)getAllObjectsFromDatabaseWithType:(NSString *)type;

@end
