//
//  User.m
//  Howl
//
//  Created by Landon Alder on 10/29/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import "User.h"
@interface User ()

@property(strong, atomic) NSString * pEmail;
@property(strong, atomic) NSNumber * pActive;

@end

@implementation User

-(NSString *)getEmail
{
    return self.pEmail;
}

-(BOOL)isActive
{
    // Need to perform check if they're in the DB in the future
    return [self.pActive boolValue];
}

-(void)setEmail:(NSString *)email
{
    self.pEmail = email;
}

-(void)setActive:(BOOL)active
{
    self.pActive = [NSNumber numberWithBool:active];
}

@end
