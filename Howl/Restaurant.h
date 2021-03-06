//
//  Restaurant.h
//  Howl
//
//  Created by Landon Alder on 10/29/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Callback.h"

@interface Restaurant : NSObject <CallbackDelegate>

-(void)setName:(NSString *)name;
-(void)setNumber:(NSInteger)number;
-(void)setAddress:(NSString *)address;
-(void)setPhone:(NSString *)phone;
-(void)setLatitude:(double)latitude;
-(void)setLongitude:(double)longitude;
-(void)setVotes:(NSInteger)votes;

-(NSString *)getName;
-(NSString *)getAddress;
-(NSString *)getPhone;
-(double)getLatitude;
-(double)getLongitude;
-(NSInteger)getVotes;

-(void)increaseVotes;
-(void)decreaseVotes;

-(void)updateInfo;

@end
