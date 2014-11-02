//
//  ExistingUserViewController.m
//  Shuttle.ObjC
//
//  Created by mchan2 on 11/2/14.
//  Copyright (c) 2014 Mercury. All rights reserved.
//

#import "ExistingUserViewController.h"

@implementation ExistingUserViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
//    [self insertReturnToHomeButton];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self insertReturnToHomeButton];
    [self insertPaymentButton];
}
-(void)insertReturnToHomeButton
{
    UIButton *homeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [homeBtn setTitle:@"Done" forState:UIControlStateNormal];
    [homeBtn addTarget:self action:@selector(userPressedHomeButton) forControlEvents:UIControlEventTouchUpInside];
    homeBtn.frame = CGRectMake(5, 5, 160, 60);
    [self.view addSubview:homeBtn];
}

-(void)insertPaymentButton
{
    UIButton *homeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [homeBtn setTitle:@"Pay Now" forState:UIControlStateNormal];
    [homeBtn addTarget:self action:@selector(payNow) forControlEvents:UIControlEventTouchUpInside];
    homeBtn.frame = CGRectMake(8, 530, 160, 60);
    [self.view addSubview:homeBtn];
}

-(void)payNow
{
    NSLog(@"PAY UP!");
}

-(void)userPressedHomeButton
{
    NSLog(@"Time to go home...");
//    NSNotification * notification = [NSNotification notificationWithName:@"BACKTOINDEXNOTE" object:nil];
//    [[NSNotificationCenter defaultCenter] postNotification:notification];

    
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
    
    //[self dismissViewControllerAnimated:YES completion:nil];
    //[self performSegueWithIdentifier:@"segueToNymiDetectionHomeView" sender:self];
}

@end
