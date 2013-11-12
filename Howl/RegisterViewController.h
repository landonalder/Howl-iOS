//
//  RegisterViewController.h
//  Howl
//
//  Created by Landon Alder on 11/11/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property (atomic, weak) IBOutlet UITextField * pEmail;
@property (atomic, weak) IBOutlet UITextField * pPassword;
@property (atomic, weak) IBOutlet UITextField * pConfirm;
@property (atomic, weak) IBOutlet UIButton * pRegister;


@end
