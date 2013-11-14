//
//  IntroViewController.m
//  Howl
//
//  Created by Landon Alder on 11/11/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import "IntroViewController.h"

@interface IntroViewController ()

@end

@implementation IntroViewController

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
    [self initView];
}

-(void)initView
{
    UIImageView * bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"seattle.png"]];
    bg.frame = [[UIScreen mainScreen] bounds];
    bg.contentMode = UIViewContentModeScaleToFill;
    [self.view insertSubview:bg atIndex:0];
    
    self.pLogin.layer.cornerRadius = 3;
    self.pLogin.backgroundColor = [UIColor colorWithRed:160.0f/255.0f green:160.0f/255.0f blue:160.0f/255.0f alpha:0.7];
    self.pLogin.clipsToBounds = YES;
    
    self.pRegister.layer.cornerRadius = 3;
    self.pRegister.backgroundColor = [UIColor colorWithRed:160.0f/255.0f green:160.0f/255.0f blue:160.0f/255.0f alpha:0.7];
    self.pRegister.clipsToBounds = YES;
    
    [self.pLogin addTarget:self action:@selector(loginTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.pRegister addTarget:self action:@selector(registerTapped) forControlEvents:UIControlEventTouchUpInside];
}

-(void)loginTapped
{
    [self.pSubmit addTarget:self action:@selector(submitLogin) forControlEvents:UIControlEventTouchUpInside];
    [self changeView];
}

-(void)registerTapped
{
    [self.pSubmit addTarget:self action:@selector(submitRegistration) forControlEvents:UIControlEventTouchUpInside];
    [self changeView];
    [UIView transitionWithView:self.pConfirm
                      duration:0.4
                       options:UIViewAnimationOptionTransitionFlipFromBottom
                    animations:NULL
                    completion:NULL];
    self.pConfirm.hidden = NO;
}

-(void)submitLogin
{
    NSLog(@"%@", @"Login!");
}

-(void)submitRegistration
{
    NSLog(@"%@", @"Registration!");
}


-(void)changeView
{
    [UIView transitionWithView:self.pEmail
                      duration:0.4
                       options:UIViewAnimationOptionTransitionFlipFromBottom
                    animations:NULL
                    completion:NULL];
    self.pEmail.hidden = NO;
    
    [UIView transitionWithView:self.pPassword
                      duration:0.4
                       options:UIViewAnimationOptionTransitionFlipFromBottom
                    animations:NULL
                    completion:NULL];
    self.pPassword.hidden = NO;
    
    [UIView transitionWithView:self.pSubmit
                      duration:0.4
                       options:UIViewAnimationOptionTransitionFlipFromBottom
                    animations:NULL
                    completion:NULL];
    self.pSubmit.hidden = NO;
    
    [UIView transitionWithView:self.pLogin
                      duration:0.4
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:NULL
                    completion:NULL];
    self.pLogin.hidden = YES;
    [UIView transitionWithView:self.pRegister
                      duration:0.4
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:NULL
                    completion:NULL];
    self.pRegister.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
