//
//  NetworkCallback.h
//  Howl
//
//  Created by Landon Alder on 11/18/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkCallback <NSObject>

-(void)finishedLoading:(NSData *)data;

@end

@interface NetworkCallback : NSObject

@end
