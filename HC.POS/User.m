//
//  User.m
//  Shuttle.ObjC
//
//  Created by mchan2 on 11/2/14.
//  Copyright (c) 2014 Mercury. All rights reserved.
//

#import "User.h"
#import "AppDelegate.h"

@implementation User
@synthesize driversLicense = _driversLicense;
@synthesize nui = _nui;

-(id)initWithLicense:(DriversLicense *)dl andNymiInfo:(NymiUserInfo *)info
{
    self = [super init];
    
    if (self) {
        driversLicense = dl;
        nui = info;
//        _driversLicense = dl;
//        _nui = info;
    }
    
    return self;
}

-(void)updateToUsersList
{
    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    [delegate addUser:self];
}
@end
