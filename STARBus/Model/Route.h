//
//  Route.h
//  STARBus
//
//  Created by Romain Rolland on 23/06/2015.
//  Copyright (c) 2015 romainrolland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Trip;

@interface Route : NSManagedObject

@property (nonatomic, retain) NSString * color;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * nameLong;
@property (nonatomic, retain) NSString * nameShort;
@property (nonatomic, retain) NSString * textColor;
@property (nonatomic, retain) NSSet *trips;
@end

@interface Route (CoreDataGeneratedAccessors)

- (void)addTripsObject:(Trip *)value;
- (void)removeTripsObject:(Trip *)value;
- (void)addTrips:(NSSet *)values;
- (void)removeTrips:(NSSet *)values;

@end
