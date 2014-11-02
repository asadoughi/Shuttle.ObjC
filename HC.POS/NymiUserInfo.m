//
//  NymiUserInfo.m
//  Shuttle.ObjC
//
//  Created by mchan2 on 11/2/14.
//  Copyright (c) 2014 Mercury. All rights reserved.
//

#import "NymiUserInfo.h"

@implementation NymiUserInfo
@synthesize nymiKey = _nymiKey;
@synthesize nymiId = _nymiId;

-(id)initWithKey:(NSString *)provisionKey andId:(NSString *)provisionId andHandle:(int)handle
{
    self = [super init];
    
    if (self) {
        _nymiKey = [provisionKey copy];
        _nymiId = [provisionId copy];
        _nymiHandle = handle;
    }
    
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"key is %@, id is %@, handle is %d", _nymiKey, _nymiId, _nymiHandle];
}

@end
