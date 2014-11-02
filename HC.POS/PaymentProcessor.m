//
//  PaymentProcessor.m
//  Shuttle.ObjC
//
//  Created by mchan2 on 11/2/14.
//  Copyright (c) 2014 Mercury. All rights reserved.
//

#import "PaymentProcessor.h"

@implementation PaymentProcessor

-(id)initWithParams:(NSDictionary *)params
{
    self = [super init];
    
    if (self) {
        // payment_params = params;
    }
    
    return self;
}
-(BOOL)process:(NSDictionary*)dictionary
{
    // Create a JSON POST
//    NSURL *url = [NSURL URLWithString:@"https://w1.mercurycert.net/PaymentsAPI/Credit/Sale"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
//    [request setTimeoutInterval:30];
//    [request setHTTPMethod:@"POST"];
//    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    
//    // Add Authorization header
//    NSString *credentials = [NSString stringWithFormat:@"%@:%@", @"019588466313922", @"RFMWwCKXRt5USrQy0906aaiRuI7MkXBz4gUTEYZ61M0iEgUQC"];
//    NSString *base64Credentials = @"CKXRt5USr"; //[self base64String:credentials];
//    [request addValue:[@"Basic " stringByAppendingString:base64Credentials] forHTTPHeaderField:@"Authorization"];
//    
//    // Serialize NSDictionary to JSON data
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
//    
//    // Add JSON data to request body
//    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-Length"];
//    [request setHTTPBody: jsonData];
//    
//    // Process request async
//    [NSURLConnection connectionWithRequest:request delegate:self];
    return YES;
}

/*
 - (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
 
 // Deserialize response from REST service
 NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
 
 if ([result objectForKey:@"CmdStatus"]
 && [[result objectForKey:@"CmdStatus"] isEqualToString:@"Approved"]) {
 
 // Approved logic here
 
 } else {
 
 // Declined logic here
 
 }
 
}    
 
 */
@end
