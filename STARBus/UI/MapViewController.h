//
//  MapViewController.h
//  STARBus
//
//  Created by Romain Rolland on 23/06/2015.
//  Copyright (c) 2015 romainrolland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

static NSString * const mapViewControllerStoryboardIdentifier = @"MapViewControllerStoryboardIdentifier";

@interface MapViewController : UIViewController <MKMapViewDelegate>

- (CGFloat)defaultHeight;

@end
