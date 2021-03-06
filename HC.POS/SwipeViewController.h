//
//  SwipeViewController.h
//  Shuttle.Mobile.Starter.Kit
//
//  Created by agharris73 on 9/18/13.
//  Copyright (c) 2013 Mercury. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "EncryptedSwipeData.h"
#import "MTSCRA.h"
#import "uniMag.h"
#import "DriversLicense.h"
#import "NymiUserInfo.h"
#import "PaymentProcessor.h"

@interface SwipeViewController : UIViewController <UIAlertViewDelegate>

//@property (nonatomic, strong) DriversLicense *new_license;
@property (nonatomic, weak) IBOutlet UIImageView *ccSwipe;
@property (strong, nonatomic) MTSCRA *magTek;
@property (strong, nonatomic) uniMag *uniMag;


@property (strong, nonatomic) EncryptedSwipeData *encryptedSwipeData;

// uDynamo Button/Switch
@property (strong, nonatomic) IBOutlet UIButton *simSwipeUdynamoButton;
- (IBAction)simSwipeuDynamoButtonPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UISwitch *simSwipeuDynamoSwitch;
- (IBAction)simSwipeduDynamoSwitchFlipped:(id)sender;

// iDynamo Button/Switch
@property (strong, nonatomic) IBOutlet UIButton *simSwipeiDynamoButton;
- (IBAction)simSwipeiDynamoButtonPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UISwitch *simSwipeiDynamoSwitch;
- (IBAction)simSwipeiDynamoSwitchFlipped:(id)sender;

// UniMag II Button/Switch
@property (strong, nonatomic) IBOutlet UIButton *simSwipeUniMagIIButton;
- (IBAction)simSwipeUniMagIIButtonPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UISwitch *simSwipeUniMagIISwitch;
- (IBAction)simSwipeUniMagIISwitchFlipped:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imageCardState;

-(void)setNymiInfo:(NymiUserInfo *)nymiInfo;
@end
