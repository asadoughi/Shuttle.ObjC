//
//  PaymentProcessor.h
//  Shuttle.ObjC
//
//  Created by mchan2 on 11/2/14.
//  Copyright (c) 2014 Mercury. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PaymentProcessor : NSObject

-(BOOL)process:(NSDictionary*)dictionary;
@end
