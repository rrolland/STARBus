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
@property (nonatomic, retain) NSSet *trip;
@end

@interface Route (CoreDataGeneratedAccessors)

- (void)addTripObject:(Trip *)value;
- (void)removeTripObject:(Trip *)value;
- (void)addTrip:(NSSet *)values;
- (void)removeTrip:(NSSet *)values;

@end
