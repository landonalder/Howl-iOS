//
//  NetworkCalls.h
//  Howl
//
//  Created by Landon Alder on 11/11/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkCalls : NSObject

+(NSData *)fetchData:(NSURL *)fromURL;
+(NSArray *)parseRestaurants:(NSData *)restaurants;
+(void)setData:(NSString *)data forURL:(NSURL *)url;
+(void)putToURL:(NSURL *)url;


@end
