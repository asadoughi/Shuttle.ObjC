//
//  NymiUserInfo.h
//  Shuttle.ObjC
//
//  Created by mchan2 on 11/2/14.
//  Copyright (c) 2014 Mercury. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NymiUserInfo : NSObject
{
    NSString* nymiKey;
    NSString* nymiId;
    int _nymiHandle;
}

@property(nonatomic, copy) NSString* nymiKey;
@property(nonatomic, copy) NSString* nymiId;

-(id)initWithKey:(NSString *)provisionKey andId:(NSString *)provisionId andHandle:(int)handle;
@end
