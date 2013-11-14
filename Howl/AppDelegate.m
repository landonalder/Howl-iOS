//
//  AppDelegate.m
//  Howl
//
//  Created by Landon Alder on 10/23/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"
#import "IntroViewController.h"
#import "ListViewController.h"
#import "ObjectFactory.h"
#import "User.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self loadView];
    [self initLocationManager];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [locationManager stopMonitoringSignificantLocationChanges];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [locationManager stopMonitoringSignificantLocationChanges];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)initLocationManager
{
    if (!locationManager)
    {
        locationManager = [CLLocationManager new];
        locationManager.delegate = self;
        locationManager.distanceFilter = 40;
    }
    [locationManager startMonitoringSignificantLocationChanges];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [[ObjectFactory getUser] setLocation:[locations lastObject]];
}


-(void)loadView
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
    // Future check if user account is created
    if (FALSE)
    {
        IntroViewController * viewController = [[IntroViewController alloc] initWithNibName:@"Intro" bundle:nil];
        self.window.rootViewController = viewController;
    } else
    {
        ListViewController * viewController = [[ListViewController alloc] initWithNibName:@"List" bundle:nil];
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
        self.window.rootViewController = self.navigationController;
        
        // Navigation bar appearance
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.0f/255.0f green:121.0f/255.0f blue:226.0f/255.f alpha:1.0];
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
        UIView *colourView = [[UIView alloc] initWithFrame:CGRectMake(0.f, -20.f, 320.f, 64.f)];
        colourView.opaque = NO;
        colourView.alpha = .4f;
        colourView.backgroundColor = self.navigationController.navigationBar.barTintColor;
        [self.navigationController.navigationBar.layer insertSublayer:colourView.layer atIndex:1];
    }
    
    [self.window makeKeyAndVisible];
}

@end
