//
//  NymiDetectionViewController.h
//  Shuttle.ObjC
//
//  Created by mchan2 on 11/1/14.
//  Copyright (c) 2014 Mercury. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Wit/Wit.h>
#include "NclWrapper.h"
#import "NymiUserInfo.h"

@interface NymiDetectionViewController : UIViewController <NclEventProtocol, UIAlertViewDelegate, WitDelegate>

// conform to ncl event protocol implementation
-(void) incomingNclEvent: (NclEvent* ) nclEvent;
@end
