//
//  ObjectFactory.h
//  Howl
//
//  Created by Landon Alder on 10/29/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Callback.h"
#import "Restaurant.h"

@interface ObjectFactory : NSObject

+(User *)getUser;
+(NSMutableArray *)getRestaurants;
+(Restaurant *)getRestaurant:(NSUInteger)number;
+(void)addRestaurant:(Restaurant *)rest atIndex:(NSUInteger)index;
+(void)addRestaurant:(Restaurant *)rest;

@end
