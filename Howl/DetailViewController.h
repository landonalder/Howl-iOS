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

@property (atomic, weak) IBOutlet UITableView * pTable;

@property (atomic, weak) IBOutlet MKMapView * pMap;

@property (atomic, weak) IBOutlet UIScrollView * scrollView;

@property (atomic, weak) IBOutlet UIButton * pUpVote;
@property (atomic, weak) IBOutlet UIButton * pDownVote;

@property (atomic) NSInteger restNum;

-(void)initFields;

@end
