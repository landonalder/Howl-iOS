//
//  ObjectFactory.m
//  Howl
//
//  Created by Landon Alder on 10/29/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import "ObjectFactory.h"
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

+(Restaurant *)getRestaurant:(NSUInteger)number
{
    if (restaurants == nil)
    {
        restaurants = [NSMutableArray new];
        NSArray * restList = [NetworkCalls parseRestaurants:[NetworkCalls fetchData:[[NSURL alloc] initWithString:@"http://nodejs-discoverhowl.rhcloud.com/list/1"]]];
        NSDictionary * temp;
        Restaurant * r;
        for (int i = 0; i < [restList count]; i++)
        {
            temp = [restList objectAtIndex:i];
            r = [Restaurant new];
            [r setNumber:i];
            [r setName: [temp objectForKey:@"restname"]];
            [r setAddress:[temp objectForKey:@"restaddress"]];
            [r setPhone:[temp objectForKey:@"restphone"]];
            [r setLatitude:[[temp objectForKey:@"restlat"] doubleValue]];
            [r setLongitude:[[temp objectForKey:@"restlong"] doubleValue]];
            [r setVotes:[[temp objectForKey:@"restvotes"] integerValue]];
            [restaurants addObject:r];
        }
        return restaurants[0];
    } else
    {
        return [restaurants objectAtIndex:number];
    }
}

@end
