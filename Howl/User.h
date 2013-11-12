//
//  User.h
//  Howl
//
//  Created by Landon Alder on 10/29/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

-(NSString *)getEmail;
-(BOOL)isActive;
-(void)setEmail:(NSString *)email;
-(void)setActive:(BOOL)active;

@end
