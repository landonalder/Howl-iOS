//
//  DetailViewController.h
//  Howl
//
//  Created by Landon Alder on 10/29/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DetailViewController : UIViewController <UITableViewDelegate>

@property (atomic, weak) IBOutlet UILabel * pRank;
@property (atomic, weak) IBOutlet UILabel * pVotes;
@property (atomic, weak) IBOutlet UILabel * pCuisine;
@property (atomic, weak) IBOutlet UILabel * pHours;
@property (atomic, weak) IBOutlet UILabel * pDrinks;
@property (atomic, weak) IBOutlet UILabel * pTakeOut;

@property (atomic, weak) IBOutlet UITableView * pContact;

@property (atomic, weak) IBOutlet MKMapView * pMap;

@property (atomic, weak) IBOutlet UIScrollView * scrollView;

@property (atomic) NSInteger restNum;

-(void)initFields;

@end
