//
//  HopscotchProject.h
//  Hopscotch-iOS-Test
//
//  Created by Flatiron School on 1/11/17.
//  Copyright © 2017 Samantha John. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HopscotchProject : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *screenShotURL;

- (id)initWithTitle:(NSString *)title author:(NSString *)author screenShotURL:(NSString *) screenShotURL;

- (instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end
