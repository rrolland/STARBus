//
//  MainViewController.m
//  STARBus
//
//  Created by Romain Rolland on 23/06/2015.
//  Copyright (c) 2015 romainrolland. All rights reserved.
//

#import "MainViewController.h"
#import "MapViewController.h"
#import "MainTableViewController.h"
#import "UIView+Constraints.h"
#import "GTFSDataHelper.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Route.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIView *mapView;
@property (weak, nonatomic) IBOutlet UIView *tableView;
@property (nonatomic, strong) MapViewController *mapViewController;
@property (nonatomic, strong) MainTableViewController *mapTableViewController;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GTFSDataHelper *theGTFSDataHelper = [[GTFSDataHelper alloc] init];
    
    NSArray *theRoutes = [theGTFSDataHelper parseGTFSFile:@"routes"];
    
     __block NSManagedObjectContext *managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    __block NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    
    [theRoutes enumerateObjectsUsingBlock:^(NSArray *obj, NSUInteger idx, BOOL *stop) {
        
        if (idx > 0) {
            Route * aRoute = [NSEntityDescription insertNewObjectForEntityForName:@"Route" inManagedObjectContext:managedObjectContext];
            //route_id,agency_id,route_short_name,route_long_name,route_desc,route_type,route_url,route_color,route_text_color
            
            
            aRoute.identifier = [f numberFromString:[obj objectAtIndex:0]];
            aRoute.desc = [obj objectAtIndex:4];
            aRoute.nameLong = [obj objectAtIndex:3];
            aRoute.nameShort = [obj objectAtIndex:2];
            aRoute.textColor = [obj objectAtIndex:8];
            aRoute.color = [obj objectAtIndex:7];
        }
       
        
        
    }];
    
    NSError *error;
    
    if (![managedObjectContext save:&error]) {
        NSLog(@"Erreur lors de l'enregistrement des données %@ - %@", error, [error userInfo]);
    }
    
    
    [self addMapTableViewController];
    [self addMapViewController];
       
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Custom Table View

- (void)addMapTableViewController {
    self.mapTableViewController  = [self.storyboard instantiateViewControllerWithIdentifier:mainTableViewControllerStoryboardIdentifier];
    [self addChildViewController:self.mapTableViewController];
    [self.tableView addSubview:self.mapTableViewController.view];
    [self.mapTableViewController didMoveToParentViewController:self];
    
    [UIView setStretchContraintsForParentView:self.tableView child:self.mapTableViewController.view];
    
}

- (void)addMapViewController {
    self.mapViewController  = [self.storyboard instantiateViewControllerWithIdentifier:mapViewControllerStoryboardIdentifier];
    [self addChildViewController:self.mapViewController];
    [self.mapView addSubview:self.mapViewController.view];
    self.mapViewController.view.frame = self.mapView.frame;
    [self.mapViewController didMoveToParentViewController:self];
    
    [UIView setStretchContraintsForParentView:self.mapView child:self.mapViewController.view];
    
}

@end
