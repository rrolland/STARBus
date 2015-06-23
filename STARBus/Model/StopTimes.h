//
//  StopTimes.h
//  STARBus
//
//  Created by Romain Rolland on 23/06/2015.
//  Copyright (c) 2015 romainrolland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Stop, Trip;

@interface StopTimes : NSManagedObject

@property (nonatomic, retain) NSDate * arrivalTime;
@property (nonatomic, retain) NSDate * departureTime;
@property (nonatomic, retain) NSNumber * stopId;
@property (nonatomic, retain) NSNumber * stopSequence;
@property (nonatomic, retain) NSNumber * tripId;
@property (nonatomic, retain) Trip *trip;
@property (nonatomic, retain) Stop *stop;

@end
