//
//  HopscotchProject.m
//  Hopscotch-iOS-Test
//
//  Created by Flatiron School on 1/11/17.
//  Copyright © 2017 Samantha John. All rights reserved.
//

#import "HopscotchProject.h"

@implementation HopscotchProject

- (id)initWithTitle:(NSString *)title author:(NSString *)author screenShotURL:(NSString *) screenShotURL{
    
    if ((self = [super init])) {
        self.title = title;
        self.author = author;
        self.screenShotURL = screenShotURL;
    }
    return self;

}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    
    if (self) {
        
        self.title = dictionary[@"title"];
        self.author = dictionary[@"author"];
        self.screenShotURL = dictionary[@"screenshot_url"];
        
        
    }
    
    return self;
    
    
}


@end
