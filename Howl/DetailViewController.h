//
//  DetailViewController.h
//  Howl
//
//  Created by Landon Alder on 10/29/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (atomic, weak) IBOutlet UILabel * pRank;
@property (atomic, weak) IBOutlet UILabel * pVotes;
@property (atomic, weak) IBOutlet UILabel * pRestName;
@property (atomic, weak) IBOutlet UILabel * pCuisine;
@property (atomic, weak) IBOutlet UILabel * pHours;
@property (atomic, weak) IBOutlet UILabel * pDrinks;
@property (atomic, weak) IBOutlet UILabel * pTakeOut;

@property (atomic, weak) IBOutlet UIButton * pCall;
@property (atomic, weak) IBOutlet UIButton * pLocate;

@property (atomic) NSInteger restNum;

-(void)initFields;

@end
