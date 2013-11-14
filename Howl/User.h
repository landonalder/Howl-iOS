//
//  User.h
//  Howl
//
//  Created by Landon Alder on 10/29/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface User : NSObject

-(NSString *)getEmail;
-(BOOL)isActive;
-(CLLocation *)getLocation;
-(void)setLocation:(CLLocation *)loc;
-(void)setEmail:(NSString *)email;
-(void)setActive:(BOOL)active;

@end
