//
//  GTFSDataHelper.h
//  STARBus
//
//  Created by Romain Rolland on 25/06/2015.
//  Copyright (c) 2015 romainrolland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHCSVParser.h"

@interface GTFSDataHelper : NSObject

- (NSArray *)parseGTFSFile:(NSString *)theFile;

@end
