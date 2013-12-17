//
//  Restaurant.m
//  Howl
//
//  Created by Landon Alder on 10/29/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import "Restaurant.h"
#import "NetworkCalls.h"

@interface Restaurant ()

@property (strong, atomic) NSString * pName;
@property (strong, atomic) NSString * pAddress;
@property (strong, atomic) NSString * pPhone;
@property (atomic) double pLatitude;
@property (atomic) double pLongitude;
@property (atomic) NSInteger pVotes;
@property (atomic) NSInteger pNumber;

@end

@implementation Restaurant

-(void)setName:(NSString *)name
{
    self.pName = name;
}

-(void)setNumber:(NSInteger)number
{
    self.pNumber = number;
}

-(void)setAddress:(NSString *)address
{
    self.pAddress = address;
}

-(void)setPhone:(NSString *)phone
{
    self.pPhone = phone;
}

-(void)setLatitude:(double)latitude
{
    self.pLatitude = latitude;
}

-(void)setLongitude:(double)longitude
{
    self.pLongitude = longitude;
}

-(void)setVotes:(NSInteger)votes
{
    self.pVotes = votes;
}

-(NSString *)getName
{
    return self.pName;
}

-(NSString *)getAddress
{
    return self.pAddress;
}

-(NSString *)getPhone
{
    return self.pPhone;
}

-(double)getLatitude
{
    return self.pLatitude;
}

-(double)getLongitude
{
    return self.pLongitude;
}

-(NSInteger)getVotes
{
    return self.pVotes;
}

-(void)increaseVotes
{
    [NetworkCalls putToURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%d", @"http://nodejs-discoverhowl.rhcloud.com/vote/", self.pNumber]]];
    [self updateInfo];
}

// Update the info for the restaurant whenever an action is taken (ex, increase votes)
-(void)updateInfo
{
    [NetworkCalls fetchData:[[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%d", @"http://nodejs-discoverhowl.rhcloud.com/restaurants/", self.pNumber]] withCallback:self];
}

-(void)onAction:(NSString *)action object:(NSObject *)value;
{
    NSDictionary * temp = (NSDictionary *)[(NSArray *) value objectAtIndex:0];
    [self setName: [temp objectForKey:@"restname"]];
    [self setAddress:[temp objectForKey:@"restaddress"]];
    [self setPhone:[temp objectForKey:@"restphone"]];
    [self setLatitude:[[temp objectForKey:@"restlat"] doubleValue]];
    [self setLongitude:[[temp objectForKey:@"restlong"] doubleValue]];
    [self setVotes:[[temp objectForKey:@"restvotes"] integerValue]];
}

-(void)decreaseVotes
{
    // code to decrease
}



@end
