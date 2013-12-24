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
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView.contentSize = CGSizeMake(320, 644);
    self.scrollView.contentOffset = CGPointMake(0, 44);
}

-(void)initMap
{
    MKPointAnnotation * point = [[MKPointAnnotation alloc] init];
    point.coordinate = CLLocationCoordinate2DMake(r.getLongitude, r.getLatitude);
    
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
    [self.pMap setRegion:region animated:FALSE];
    [self.pMap regionThatFits:region];
}

-(void)initFields
{
    r = [ObjectFactory getRestaurant:self.restNum];
    [self.navigationController.navigationBar setTitleTextAttributes: @{
                                                            NSForegroundColorAttributeName: [UIColor whiteColor],
                                                            NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Medium" size:20.0f]
                                                            }];
    self.title = r.getName;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 44;
    }
    else
    {
        return 60;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil)
    {
        cell = [UITableViewCell new];
        
        UILabel * title = [UILabel new];
        title.frame = CGRectMake(15, 2, 270, 40);
        title.backgroundColor = [UIColor clearColor];
        title.font = [UIFont boldSystemFontOfSize:17.0f];

        
        UILabel * info = [UILabel new];
        info.textAlignment = NSTextAlignmentRight;
        info.frame = CGRectMake(0, 2, 305, 40);
        info.backgroundColor = [UIColor clearColor];
        if (indexPath.row == 0)
        {
            title.text = @"Call";
            info.text = [r getPhone];
        } else
        {
            title.text = @"Directions";
            info.text = [r getAddress];
            UILabel * city = [UILabel new];
            city.frame = CGRectMake(0, 30, 305, 20);
            city.textAlignment = NSTextAlignmentRight;
            city.backgroundColor = [UIColor clearColor];
            city.font = [UIFont systemFontOfSize:15.0];
            city.textColor = [UIColor grayColor];
            city.text = @"Bellingham, WA";
            [cell addSubview:city];
        }
        [cell addSubview:title];
        [cell addSubview:info];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        [self call];
    } else
    {
        [self navigate];
    }
}



-(void)call
{
    NSString * telNum = [[[r getPhone] componentsSeparatedByCharactersInSet:[[NSCharacterSet alphanumericCharacterSet] invertedSet]] componentsJoinedByString:@""];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", telNum]]];
}

-(void)navigate
{
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
