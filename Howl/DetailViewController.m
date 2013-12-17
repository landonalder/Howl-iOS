//
//  DetailViewController.m
//  Howl
//
//  Created by Landon Alder on 10/29/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "DetailViewController.h"
#import "User.h"
#import "ObjectFactory.h"
#import "Restaurant.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

Restaurant * r;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initFields];
    [self initMap];
    self.scrollView.contentSize = CGSizeMake(320, 600);
}

-(void)initMap
{
    MKPointAnnotation * point = [[MKPointAnnotation alloc] init];
    point.coordinate = CLLocationCoordinate2DMake(r.getLongitude, r.getLatitude);
    point.title = r.getName;
    
    CLLocationCoordinate2D track;
    track.latitude = r.getLongitude;
    track.longitude = r.getLatitude;
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.01;
    span.longitudeDelta = 0.01;
    region.span = span;
    region.center = track;
    [self.pMap addAnnotation:point];
    [self.pMap selectAnnotation:point animated:YES];
    [self.pMap setRegion:region animated:FALSE];
    [self.pMap regionThatFits:region];
}

-(void)initFields
{
    r = [ObjectFactory getRestaurant:self.restNum];
    self.pRestName.text = r.getName;
    self.pVotes.text = [NSString stringWithFormat:@"%i", r.getVotes];
    [self.pCall addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
    [self.pNavigate addTarget:self action:@selector(navigate) forControlEvents:UIControlEventTouchUpInside];
}

-(void)call
{
    NSString * telNum = [[[r getPhone] componentsSeparatedByCharactersInSet:[[NSCharacterSet alphanumericCharacterSet] invertedSet]] componentsJoinedByString:@""];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", telNum]]];
}

-(void)navigate
{
    // Still much more to do
    MKPlacemark * placeMark = [[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(r.getLongitude, r.getLatitude) addressDictionary:nil];
    MKMapItem * mapItem = [[MKMapItem alloc] initWithPlacemark:placeMark];
    mapItem.name = r.getName;
    NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey :MKLaunchOptionsDirectionsModeDriving};
    MKMapItem *currentLocationMapItem = [MKMapItem mapItemForCurrentLocation];
    [MKMapItem openMapsWithItems:@[currentLocationMapItem, mapItem]
                   launchOptions:launchOptions];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
