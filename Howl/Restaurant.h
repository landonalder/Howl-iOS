//
//  Restaurant.h
//  Howl
//
//  Created by Landon Alder on 10/29/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject

-(void)setName:(NSString *)name;
-(void)setAddress:(NSString *)address;
-(void)setPhone:(NSString *)phone;
-(void)setDistance:(NSString *)distance;

-(NSString *)getName;
-(NSString *)getAddress;
-(NSString *)getPhone;
-(NSString *)getDistance;


@end
