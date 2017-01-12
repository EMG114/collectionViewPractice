//
//  HopscotchAPIClient.m
//  Hopscotch-iOS-Test
//
//  Created by Flatiron School on 1/11/17.
//  Copyright © 2017 Samantha John. All rights reserved.
//

#import "HopscotchAPIClient.h"



@implementation HopscotchAPIClient

NSString *const HOPSCOTCH_API_URL = @"https://hopscotch-ios-test.herokuapp.com/projects";

+(void)getProjectsWithCompletion:(void (^)(NSArray *))completionBlock{

    NSString *urlString = @"https://hopscotch-ios-test.herokuapp.com/projects";
    
    NSURL *nsurlString = [NSURL URLWithString:urlString];
    
    NSURLSession *thisSession = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *thisTask = [thisSession dataTaskWithURL:nsurlString completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        NSDictionary *jsonResponseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSArray *projectsArray = [jsonResponseDictionary valueForKey:@"projects"];
        
        NSLog(@"%@",projectsArray);
                                          
        completionBlock(projectsArray);
    }];
    
    [thisTask resume];
    
}

@end




