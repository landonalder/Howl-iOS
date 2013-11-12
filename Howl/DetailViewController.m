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
}

-(void)initFields
{
    r = [ObjectFactory getRestaurant:self.restNum];
    self.pRestName.text = r.getName;
    self.pVotes.text = [NSString stringWithFormat:@"%i", r.getVotes];
    [self.pCall addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
    [self.pLocate addTarget:self action:@selector(locate) forControlEvents:UIControlEventTouchUpInside];
}

-(void)call
{
    NSString * telNum = [[[r getPhone] componentsSeparatedByCharactersInSet:[[NSCharacterSet alphanumericCharacterSet] invertedSet]] componentsJoinedByString:@""];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", telNum]]];
}

-(void)locate
{
    // Still much more to do
    MKMapItem * mapItem = [[MKMapItem alloc] initWithPlacemark:nil];
    [mapItem openInMapsWithLaunchOptions:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
