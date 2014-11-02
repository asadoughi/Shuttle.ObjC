//
//  DriversLicense.h
//  Shuttle.ObjC
//
//  Created by mchan2 on 11/1/14.
//  Copyright (c) 2014 Mercury. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DriversLicense : NSObject

- (id) initWithData:(NSData *)data;
-(BOOL)isInvalid;
@end
