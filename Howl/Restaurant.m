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
@property (strong, atomic) NSString * pDistance;

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

-(void)setDistance:(NSString *)distance
{
    self.pDistance = distance;
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

-(NSString *)getDistance
{
    return self.pDistance;
}


@end
