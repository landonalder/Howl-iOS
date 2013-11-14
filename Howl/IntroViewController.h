//
//  IntroViewController.h
//  Howl
//
//  Created by Landon Alder on 11/11/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroViewController : UIViewController

@property (atomic, weak) IBOutlet UIButton * pLogin;
@property (atomic, weak) IBOutlet UIButton * pRegister;
@property (atomic, weak) IBOutlet UIButton * pSubmit;

@property (atomic, weak) IBOutlet UITextField * pEmail;
@property (atomic, weak) IBOutlet UITextField * pPassword;
@property (atomic, weak) IBOutlet UITextField * pConfirm;


@end
