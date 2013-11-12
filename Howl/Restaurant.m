//
//  Restaurant.m
//  Howl
//
//  Created by Landon Alder on 10/29/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import "Restaurant.h"

@interface Restaurant ()

@property (strong, atomic) NSString * pName;
@property (strong, atomic) NSString * pAddress;
@property (strong, atomic) NSString * pPhone;
@property (atomic) double pLatitude;
@property (atomic) double pLongitude;
@property (atomic) NSInteger pVotes;



@end

@implementation Restaurant

-(void)setName:(NSString *)name
{
    self.pName = name;
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



@end
