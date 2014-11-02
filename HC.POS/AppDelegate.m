//
//  AppDelegate.m
//  HC.POS
//
//  Created by agharris73 on 9/4/13.
//  Copyright (c) 2013 Mercury. All rights reserved.
//

#import "AppDelegate.h"
#import <Wit/Wit.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Wit sharedInstance].accessToken = @"3FYBR7MW4V5OIZPKMWCQ3HJEFT26EGOC"; // replace xxx by your Wit.AI access token
    //enabling detectSpeechStop will automatically stop listening the microphone when the user stop talking
    [Wit sharedInstance].detectSpeechStop = WITVadConfigDetectSpeechStop;
    return YES;
}

-(void)setNymiId:(NSString *)newNymiId
{
    nymiId = newNymiId;
}

-(void)addUser:(User *)newUser
{
    if (!users) {
        users = [[NSMutableDictionary alloc] init];
    }
    if (nymiId) {
        users[nymiId] = newUser;
        NSLog(@">> Added user with Nymi ID");
    } else {
        NSLog(@"Nope...!");
    }
}

-(BOOL)doesNotHaveNymiId:(NSString *)nymiId
{
    if (!users) {
        return YES;
    } else {
        return [users objectForKey:nymiId] == nil;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void) reset {
    self.pid = @"";
    self.message = @"";
    self.responseCode = @"";
    self.status = @"";
    self.tranType = @"";
    self.authCode = @"";
    self.authAmount = @"";
    self.amount = @"";
    self.taxAmt = @"";
    self.acqRefData = @"";
    self.cardType = @"";
    self.cvvResult = @"";
    self.displayMessage = @"";
    self.expDate = @"";
    self.invoice = @"";
    self.maskedAccount = @"";
    self.refNo = @"";
    self.statusMessage = @"";
    self.token = @"";
    self.transPostTime = @"";
    self.transactionID = @"";
    self.encryptedSwipeData = [[EncryptedSwipeData alloc] init];
}

@end
