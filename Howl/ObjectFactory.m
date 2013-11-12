//
//  ObjectFactory.m
//  Howl
//
//  Created by Landon Alder on 10/29/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import "ObjectFactory.h"
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

+(Restaurant *)getRestaurant:(NSUInteger)number
{
    if (restaurants == nil)
    {
        Restaurant * r1 = [Restaurant new];
        [r1 setName:@"McDonalds"];
        [r1 setDistance:@"1.14 mi"];
        
        Restaurant * r2 = [Restaurant new];
        [r2 setName:@"Burger King"];
        [r2 setDistance:@"1.25 mi"];

        
        Restaurant * r3 = [Restaurant new];
        [r3 setName:@"Subway"];
        [r3 setDistance:@"3.1 mi"];
        
        restaurants = [[NSMutableArray alloc] initWithObjects:r1, r2, r3, r3, r3, r3, r3, r3, r3, r3, nil];
        //restaurants = [[NSMutableArray alloc] initWithCapacity:10];
        return restaurants[0];
    } else
    {
        return [restaurants objectAtIndex:number];
    }
}

@end
