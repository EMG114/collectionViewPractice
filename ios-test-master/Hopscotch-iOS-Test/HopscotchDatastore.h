//
//  HopscotchDatastore.h
//  Hopscotch-iOS-Test
//
//  Created by Flatiron School on 1/11/17.
//  Copyright © 2017 Samantha John. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HopscotchDatastore : NSObject

@property (strong, nonatomic) NSMutableArray *projects;

+ (instancetype)sharedDataStore;

- (void)getProjectsWithCompletion:(void (^)(BOOL success))completionBlock;

@end
