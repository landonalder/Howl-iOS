//
//  Validator.m
//  Howl
//
//  Created by Landon Alder on 11/20/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import "Validator.h"

@implementation Validator

+(BOOL)stringIsEqual:(NSString *)first to:(NSString *)second
{
    return [first isEqualToString:second] && [first length] > 0;
}

@end
