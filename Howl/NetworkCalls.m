//
//  NetworkCalls.m
//  Howl
//
//  Created by Landon Alder on 11/11/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import "NetworkCalls.h"
#import "Callback.h"
#import "ObjectFactory.h"

@implementation NetworkCalls

NSData * dataResponse;

+(void)fetchData:(NSURL *)fromURL withCallback:(id<CallbackDelegate>)callback
{
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest new];
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setURL:fromURL];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            NSLog(@"%@", [connectionError localizedDescription]);
        } else {
            NSArray * restList = [NSJSONSerialization JSONObjectWithData:data options:0 error:Nil];
            [callback onAction:nil object:restList];
        }
    }];
}

+(void)putToURL:(NSURL *)url
{
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"PUT"];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

@end
