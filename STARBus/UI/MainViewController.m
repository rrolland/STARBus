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
    [self addMapTableViewController];
    [self addMapViewController];
    
    GTFSDataHelper *theGTFSDataHelper = [[GTFSDataHelper alloc] init];
    
    NSArray *theRoutes = [theGTFSDataHelper parseGTFSFile:@"routes"];
    
     __block NSManagedObjectContext *managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    [theRoutes enumerateObjectsUsingBlock:^(Route *obj, NSUInteger idx, BOOL *stop) {
        
        if (idx > 0) {
            Route * aRoute = [NSEntityDescription insertNewObjectForEntityForName:@"Route" inManagedObjectContext:managedObjectContext];
            
            aRoute.identifier = obj.identifier;
            aRoute.desc = obj.desc;
            aRoute.nameLong = obj.nameLong;
            aRoute.nameShort = obj.nameShort;
            aRoute.textColor = obj.textColor;
            aRoute.identifier = obj.identifier;
        }
       
        
        
    }];
    
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
