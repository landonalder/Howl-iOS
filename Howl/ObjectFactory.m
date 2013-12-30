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
        return nil;
    } else
    {
        return [restaurants objectAtIndex:number];
    }
}

+(UIColor *)getBlue
{
    return [UIColor colorWithRed:0.0f/255.0f green:110.0f/255.0f blue:226.0f/255.f alpha:1.0];
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
