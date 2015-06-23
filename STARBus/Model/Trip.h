//
//  Trip.h
//  STARBus
//
//  Created by Romain Rolland on 23/06/2015.
//  Copyright (c) 2015 romainrolland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Route, Stop;

@interface Trip : NSManagedObject

@property (nonatomic, retain) NSNumber * direction;
@property (nonatomic, retain) NSString * headsign;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSNumber * routeId;
@property (nonatomic, retain) NSNumber * serviceId;
@property (nonatomic, retain) Route *route;
@property (nonatomic, retain) NSSet *stop;
@end

@interface Trip (CoreDataGeneratedAccessors)

- (void)addStopObject:(Stop *)value;
- (void)removeStopObject:(Stop *)value;
- (void)addStop:(NSSet *)values;
- (void)removeStop:(NSSet *)values;

@end
