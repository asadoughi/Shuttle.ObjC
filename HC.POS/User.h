//
//  User.h
//  Shuttle.ObjC
//
//  Created by mchan2 on 11/2/14.
//  Copyright (c) 2014 Mercury. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NymiUserInfo.h"
#import "DriversLicense.h"

@interface User : NSObject
{
    DriversLicense *driversLicense;
    NymiUserInfo *nui;
}

@property(nonatomic, strong) DriversLicense *driversLicense;
@property(nonatomic, strong) NymiUserInfo *nui;
@end
