//
//  NetworkCalls.h
//  Howl
//
//  Created by Landon Alder on 11/11/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Callback.h"

@interface NetworkCalls : NSObject

+(void)fetchData:(NSURL *)fromURL withCallback:(Callback *)callback;
+(void)putToURL:(NSURL *)url;


@end
