//
//  HopscotchDatastore.m
//  Hopscotch-iOS-Test
//
//  Created by Flatiron School on 1/11/17.
//  Copyright © 2017 Samantha John. All rights reserved.
//

#import "HopscotchDatastore.h"
#import "HopscotchAPIClient.h"
#import "HopscotchProject.h"

@implementation HopscotchDatastore

+ (instancetype)sharedDataStore {
    static HopscotchDatastore *_sharedDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataStore = [[HopscotchDatastore alloc] init];
    });
    
    return _sharedDataStore;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.projects = [NSMutableArray new];
    }
    return self;
}
    
- (void)getProjectsWithCompletion:(void (^)(BOOL success))completionBlock{
    
    [HopscotchAPIClient getProjectsWithCompletion:^(NSArray *jsonProjectsArray) {
                
        for (NSDictionary *singleDictionary in jsonProjectsArray){
                        
            HopscotchProject *currentObject = [[HopscotchProject alloc] initWithDictionary:singleDictionary];
            
            [self.projects addObject:currentObject];
        }
    
        NSLog(@"%@",self.projects);
        completionBlock(YES);
    }];

}

@end
