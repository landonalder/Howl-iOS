//
//  RestCommand.m
//  Howl
//
//  Created by Landon Alder on 11/18/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import "RestCommand.h"
#import "NetworkCallback.h"

@interface RestCommand()

@property (strong,atomic) id<NetworkCallback> pCallback;

@property (strong,atomic) NSString * pUrl;

@end


@implementation RestCommand

-(void)initWith:(NSString *)url
{
    self.pUrl = url;
}

-(void)execute
{
    NSURL *url = [NSURL URLWithString:self.pUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
    
}

-(void)setCallback:(id<NetworkCallback>)callback
{
    self.pCallback = callback;
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    RestResponse * response = [RestResponse new];
    NSString * data = [[NSString alloc] initWithBytes: [responseData mutableBytes] length:[responseData length] encoding:NSUTF8StringEncoding];
    [response initWithData:data withCaller:self.pMethod];
    [self.pCallback onCallback:response];
}


@end
