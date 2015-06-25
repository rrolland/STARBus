//
//  GTFSDataHelper.m
//  STARBus
//
//  Created by Romain Rolland on 25/06/2015.
//  Copyright (c) 2015 romainrolland. All rights reserved.
//

#import "GTFSDataHelper.h"

@implementation GTFSDataHelper

- (NSArray *)parseGTFSFile:(NSString *)theFile {
    NSString *path = [[NSBundle mainBundle] pathForResource:theFile ofType:@"txt"];
    
    NSArray *rows = [NSArray arrayWithContentsOfCSVURL:[NSURL fileURLWithPath:path]];
    if (rows == nil) {
        //something went wrong; log the error and exit
        NSLog(@"error parsing file: %@", theFile);
        return nil;
    }
    
    return rows;
}

@end
