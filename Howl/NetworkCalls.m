//
//  NetworkCalls.m
//  Howl
//
//  Created by Landon Alder on 11/11/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import "NetworkCalls.h"

@implementation NetworkCalls

+(NSData *)fetchData:(NSURL *)fromURL
{
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:fromURL cachePolicy:NSURLRequestReloadRevalidatingCacheData timeoutInterval:30];
    
    NSData * urlData;
    NSURLResponse * response;
    NSError * error = nil;
    
    urlData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    
    if (!error)
    {
        return urlData;
    } else
    {
        return nil;
    }
}

+(NSArray *)parseRestaurants:(NSData *)restaurants
{
    NSError * error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:restaurants options:0 error:&error];
    
    if(!error)
    {
        return (NSArray *) object;
    } else
    {
        return nil;
    }
}

@end
