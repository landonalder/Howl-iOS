//
//  LoginViewController.h
//  Howl
//
//  Created by Landon Alder on 10/23/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (atomic, weak) IBOutlet UITextField * pEmail;
@property (atomic, weak) IBOutlet UITextField * pPassword;
@property (atomic, weak) IBOutlet UIButton * pSubmit;

@end
