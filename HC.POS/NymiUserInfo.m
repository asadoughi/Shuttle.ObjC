//
//  NymiUserInfo.m
//  Shuttle.ObjC
//
//  Created by mchan2 on 11/2/14.
//  Copyright (c) 2014 Mercury. All rights reserved.
//

#import "NymiUserInfo.h"

@implementation NymiUserInfo

-(id)initWithKey:(NSString *)provisionKey andId:(NSString *)provisionId andHandle:(int)handle
{
    self = [super init];
    
    if (self) {
        nymiKey = provisionKey;
        nymiId = provisionId;
        nymiHandle = handle;
    }
    
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"key is %@, id is %@, handle is %d", nymiKey, nymiId, nymiHandle];
}

@end
