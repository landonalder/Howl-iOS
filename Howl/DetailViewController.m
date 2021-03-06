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
    [self initButtons];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView.contentSize = CGSizeMake(320, 644);
    self.scrollView.contentOffset = CGPointMake(0, 44);
}

-(void)initMap
{
    MKPointAnnotation * point = [[MKPointAnnotation alloc] init];
    point.coordinate = CLLocationCoordinate2DMake(r.getLongitude, r.getLatitude);
    
    CLLocationCoordinate2D center;
    center.latitude = r.getLongitude;
    center.longitude = r.getLatitude;
    center.latitude += 0.01 * 0.20; // To correct for the map being shifted down
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.01;
    span.longitudeDelta = 0.01;
    
    region.span = span;
    region.center = center;
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

-(void)initButtons
{
    [self.pUpVote setTintColor:[ObjectFactory getBlue]];
    [self.pUpVote setImage: [ObjectFactory imageWithImage:[UIImage imageNamed:@"up.png"] scaledToSize:CGSizeMake(20, 11)] forState:UIControlStateNormal];
    [self.pUpVote setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 15.0, 0.0, 0.0)];
    [self.pUpVote addTarget:r action:@selector(increaseVotes) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.pDownVote setTintColor:[ObjectFactory getBlue]];
    [self.pDownVote setImage: [ObjectFactory imageWithImage:[UIImage imageNamed:@"down.png"] scaledToSize:CGSizeMake(20, 11)] forState:UIControlStateNormal];
    [self.pDownVote setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 15.0, 0.0, 0.0)];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 1) {
        return 60;
    }
    else
    {
        return 44;
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
        
        // Call/Directions section
        if (indexPath.section == 0)
        {
            info.textColor = [ObjectFactory getBlue];
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
        // Info section
        } else
        {
            info.font = [UIFont systemFontOfSize:15.0f];
            info.textColor = [UIColor grayColor];
            if (indexPath.row == 0)
            {
                title.text = @"Cuisine";
                info.text = @"Mexican";
            } else if (indexPath.row == 1)
            {
                title.text = @"Hours";
                info.text = @"11a - 12p";
            } else if (indexPath.row == 2)
            {
                title.text = @"Drinks";
                info.text = @"Full bar";
            } else            {
                title.text = @"Take out";
                info.text = @"Yes";
            }
        }
        
        [cell addSubview:title];
        [cell addSubview:info];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 2;
    } else
    {
        return 4;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            [self call];
        } else
        {
            [self navigate];
        }
    }
}

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section == 0;
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
