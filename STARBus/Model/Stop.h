//
//  Stop.h
//  STARBus
//
//  Created by Romain Rolland on 23/06/2015.
//  Copyright (c) 2015 romainrolland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class StopTimes;

@interface Stop : NSManagedObject

@property (nonatomic, retain) NSNumber * code;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *stopTimes;
@end

@interface Stop (CoreDataGeneratedAccessors)

- (void)addStopTimesObject:(StopTimes *)value;
- (void)removeStopTimesObject:(StopTimes *)value;
- (void)addStopTimes:(NSSet *)values;
- (void)removeStopTimes:(NSSet *)values;

@end
