//
//  HopscotchAPIClient.h
//  Hopscotch-iOS-Test
//
//  Created by Flatiron School on 1/11/17.
//  Copyright © 2017 Samantha John. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString *const HOPSCOTCH_API_URL;

@interface HopscotchAPIClient : NSObject

+(void)getProjectsWithCompletion:(void (^)(NSArray *jsonProjectsArray))completionBlock;

@end
