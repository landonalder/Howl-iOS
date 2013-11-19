//
//  RestCommand.h
//  Howl
//
//  Created by Landon Alder on 11/18/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestCommand : NSObject<NSURLConnectionDelegate,TransportCommandDelegate>

{
    NSMutableData * responseData;
}

-(void)execute;


-(void)initWith:(NSString *)url;

-(void)setCallback:(id<TransportCallbackDelegate>)callback;

@end
