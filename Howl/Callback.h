//
//  Callback.h
//  Howl
//
//  Created by Landon Alder on 11/20/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CallbackDelegate <NSObject>

-(void)onAction:(NSString *)action object:(NSObject *)value;

@end

@interface Callback : NSObject <CallbackDelegate>


@end
