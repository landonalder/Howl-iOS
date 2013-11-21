//
//  ObjectFactory.m
//  Howl
//
//  Created by Landon Alder on 10/29/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import "ObjectFactory.h"
#import "Callback.h"
#import "NetworkCalls.h"
#import "Restaurant.h"
#import "User.h"

@implementation ObjectFactory

NSMutableArray * restaurants;
User * user;

+(User *)getUser
{
    if (user == nil)
    {
        user = [User new];
    }
    return user;
}

+(NSMutableArray *)getRestaurants
{
    return restaurants;
}

+(void)addRestaurant:(Restaurant *)rest atIndex:(NSUInteger)index
{
    [restaurants insertObject:rest atIndex:index];
}

+(void)addRestaurant:(Restaurant *)rest
{
    [restaurants addObject:rest];
}

+(Restaurant *)getRestaurant:(NSUInteger)number
{    
    if (restaurants == nil || [restaurants count] < 1)
    {
        restaurants = [NSMutableArray new];
        Restaurant * r = [Restaurant new];
        return r;
    } else
    {
        return [restaurants objectAtIndex:number];
    }
}

@end
