//
//  NymiDetectionViewController.m
//  Shuttle.ObjC
//
//  Created by mchan2 on 11/1/14.
//  Copyright (c) 2014 Mercury. All rights reserved.
//

#import "NymiDetectionViewController.h"
#include "ncl.h"

@interface NymiDetectionViewController ()

@property BOOL nymiProvsioned, nclInitEventFailure;
@property(nonatomic, strong) NclWrapper* myNcl;

@end

@implementation NymiDetectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    [self insertProvisionButton];
    [self insertValidationButton];
    
}

-(void)insertProvisionButton
{
    UIButton *provisionBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [provisionBtn setTitle:@"Provision Nymi" forState:UIControlStateNormal];
    [provisionBtn addTarget:self action:@selector(userPressedProvisionButton) forControlEvents:UIControlEventTouchUpInside];
    provisionBtn.frame = CGRectMake(90, 190, 160, 60);
    [self.view addSubview:provisionBtn];
}

-(void)userPressedProvisionButton
{
    if (!_nymiProvsioned) {
        _myNcl = [[NclWrapper alloc] init];
        
        // set the delegate to get things started and intialize NCL
        [_myNcl setNclDelegate:self];
        
        [_myNcl setEventTypeToWaitFor:NCL_EVENT_INIT];
        [_myNcl waitNclForEvent];
    } else {
        [_myNcl findNymi];
        [_myNcl setEventTypeToWaitFor:NCL_EVENT_FIND];
        [_myNcl waitNclForEvent];
    }
}

-(void)insertValidationButton
{
    UIButton *validationBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [validationBtn setTitle:@"Validate Nymi" forState:UIControlStateNormal];
    [validationBtn addTarget:self action:@selector(userPressedValidationButton) forControlEvents:UIControlEventTouchUpInside];
    validationBtn.frame = CGRectMake(90, 250, 160, 60);
    [self.view addSubview:validationBtn];
}

-(void)userPressedValidationButton
{
    NSLog(@"WTF?");
    [_myNcl findNymi];
    [_myNcl setEventTypeToWaitFor:NCL_EVENT_FIND];
    [_myNcl waitNclForEvent];
}



// Method called when NCL events are received
- (void) incomingNclEvent:(NclEvent *)nclEvent{
    
    NSLog(@"delegate called");
    
    NclEvent currentEvent = *nclEvent;
    if (!_nymiProvsioned) {
        NSLog(@"1. NYMI NOT PROVISIONED...");
        switch (currentEvent.type)
        {
            case NCL_EVENT_INIT:
                // initialized, event, have to check it if it was successful before we move to discovery
                if (currentEvent.init.success) {
                    NSLog(@"NCL_EVENT_INIT happened!");
                    [_myNcl discoverNymi];
                    [_myNcl setEventTypeToWaitFor:NCL_EVENT_DISCOVERY];
                    [_myNcl waitNclForEvent];
                } else {
                    self.nclInitEventFailure=YES;
                }
                
                break;
                
            case NCL_EVENT_DISCOVERY:
                // normally, would display LED pattern to expect to user and ask for validation
                // here for simplicity we assume agreement
                [_myNcl agreeNymi:(currentEvent.discovery.nymiHandle)];
                [_myNcl setEventTypeToWaitFor:NCL_EVENT_AGREEMENT];
                [_myNcl waitNclForEvent];
                break;
                
            case NCL_EVENT_AGREEMENT:
                [_myNcl provisionNymi:(currentEvent.agreement.nymiHandle)];
                [_myNcl setEventTypeToWaitFor:NCL_EVENT_PROVISION];
                [_myNcl waitNclForEvent];
                break;
                
            case NCL_EVENT_PROVISION:
                 [_myNcl disconnectNymi:(currentEvent.provision.nymiHandle)];
                _nymiProvsioned=YES;
                NSLog(@"Hi: NCL_EVENT_PROVISION");
                // the NEA should persist the provsion, for this simple example, the NCL wrapper keeps the current provision
                // it is used to find the same nymi on subsequent calls
                //if (nymiProvsioned)
                if (_nymiProvsioned) {
                   NSLog(@"*** currentEvent.provision.nymiHandle: %d", currentEvent.provision.nymiHandle);
                   NSLog(@"*** currentEvent.provision.provision.id: %u", (uint8_t)currentEvent.provision.provision.id);
                   NSLog(@"*** currentEvent.provision.provision.key: %u", (uint8_t)currentEvent.provision.provision.key);
                    
                    NymiUserInfo *nui = [[NymiUserInfo alloc] initWithKey:provisionIdToStrings(currentEvent.provision.provision.key) andId:provisionIdToStrings(currentEvent.provision.provision.id) andHandle:currentEvent.provision.nymiHandle];
                    NSLog(@"HI AMIR: We have: %@", [nui description]);
                    
                }
                
                break;
                
            default:
                break;
        }//end switch on event type
    }
    
    else {    // if already provisioned, we just have to find the nymi and validate
        switch (currentEvent.type) {
            case NCL_EVENT_FIND:
                //[self updateUiText:(@"Found Nymi, validating...\n")];
                [_myNcl validateNymi:(currentEvent.find.nymiHandle)];
                [_myNcl setEventTypeToWaitFor:NCL_EVENT_VALIDATION];
                [_myNcl waitNclForEvent];
                [_myNcl stopScan];
                break;
                
            case NCL_EVENT_VALIDATION:
                NSLog(@"hi; NCL_EVENT_VALIDATION");
                // [self updateUiText:(@"Nymi validated, NEA can perform actions for validated user\n")];
                [_myNcl disconnectNymi:(currentEvent.validation.nymiHandle)];
                if (_nymiProvsioned) {
                    dispatch_async(dispatch_get_main_queue(),
                                   ^{
                                       //[self.nymiButton setHidden:(NO)];
                                       
                                       NSLog(@"EVENT_VALIDATION: currentEvent.validation.nymiHandle: %d", currentEvent.validation.nymiHandle);
                                   });
                    NSLog(@"FINALLY MADE IT HERE> IS THIS THE LASTY STOP?");
                }
                
            default:
                break;
        }
    }
}

NSString* provisionIdToStrings(NclProvisionId provisionId){
    NSMutableString* result=[[NSMutableString alloc] init];
    for(unsigned i=0; i<NCL_PROVISION_ID_SIZE; ++i)
        [result appendFormat: @"%x ", provisionId[i]];
    return result;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
