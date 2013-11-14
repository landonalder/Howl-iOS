//
//  AppDelegate.h
//  Howl
//
//  Created by Landon Alder on 10/23/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

{
    CLLocationManager * locationManager;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;

@end
