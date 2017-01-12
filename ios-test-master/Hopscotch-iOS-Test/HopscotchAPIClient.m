//
//  HopscotchAPIClient.m
//  Hopscotch-iOS-Test
//
//  Created by Flatiron School on 1/11/17.
//  Copyright © 2017 Samantha John. All rights reserved.
//

#import "HopscotchAPIClient.h"



@implementation HopscotchAPIClient

NSString *const HOPSCOTCH_API_URL = @" // create a string to turn into a URL";

+(void)getProjectsWithCompletion:(void (^)(NSArray *))completionBlock{

     // create a string to turn into a URL
    NSString *urlString = @" // create a string to turn into a URL";
    
    NSURL *nsurlString = [NSURL URLWithString:urlString];
    //conversion of urlString into NSURL String
    
    NSURLSession *thisSession = [NSURLSession sharedSession];
    //creating the session
    
    // create NSURLSessionDataTask using thisSession
    NSURLSessionDataTask *thisTask = [thisSession dataTaskWithURL:nsurlString completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        NSDictionary *jsonResponseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        //initial json is wrapped as an NSDictionary
        
        NSArray *projectsArray = [jsonResponseDictionary valueForKey:@"projects"];
        //only need the value of projects, which is an NSArray
                                          
        completionBlock(projectsArray);
    }];
    
    [thisTask resume];
    
}

@end




