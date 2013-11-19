//
//  NetworkCalls.m
//  Howl
//
//  Created by Landon Alder on 11/11/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import "NetworkCalls.h"

@implementation NetworkCalls

+(void)fetchData:(NSURL *)fromURL
{
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:fromURL cachePolicy:NSURLRequestReloadRevalidatingCacheData timeoutInterval:30];
    
    NSData * urlData;
    NSURLResponse * response;
    NSError * error = nil;
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * urldata, NSError * error) {
        [self parseRestaurants:urlData];
    }];
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

+(void)putToURL:(NSURL *)url
{
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"PUT"];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

@end
