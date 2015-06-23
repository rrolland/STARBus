//
//  Trip.h
//  STARBus
//
//  Created by Romain Rolland on 23/06/2015.
//  Copyright (c) 2015 romainrolland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Route, StopTimes;

@interface Trip : NSManagedObject

@property (nonatomic, retain) NSNumber * direction;
@property (nonatomic, retain) NSString * headsign;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSNumber * routeId;
@property (nonatomic, retain) NSNumber * serviceId;
@property (nonatomic, retain) Route *route;
@property (nonatomic, retain) NSSet *stopTimes;
@end

@interface Trip (CoreDataGeneratedAccessors)

- (void)addStopTimesObject:(StopTimes *)value;
- (void)removeStopTimesObject:(StopTimes *)value;
- (void)addStopTimes:(NSSet *)values;
- (void)removeStopTimes:(NSSet *)values;

@end
