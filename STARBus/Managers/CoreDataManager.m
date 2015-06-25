//
//  CoreDataManager.m
//  STARBus
//
//  Created by Romain Rolland on 23/06/2015.
//  Copyright (c) 2015 romainrolland. All rights reserved.
//

#import "CoreDataManager.h"
#import <CoreData/CoreData.h>

@interface CoreDataManager()

@end

@implementation CoreDataManager


static CoreDataManager *_sharedManager = nil;

#pragma mark - Shared Method

+ (instancetype)sharedManager {
    @synchronized(self) {
        if (_sharedManager == nil) {
            _sharedManager = [[CoreDataManager alloc] init];
        }
    }
    return _sharedManager;
}


- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)moc {
    self = [super init];
    if (self) {
        self.moc = moc;
    }
    return self;
}


- (NSArray *)getAllObjectsFromDatabaseWithType:(NSString *)type {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:type inManagedObjectContext:self.moc];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *result = [self.moc executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        return nil;
    }
    
    return result;


}


@end
