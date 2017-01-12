//
//  HopscotchProjectCollectionViewCell.h
//  Hopscotch-iOS-Test
//
//  Created by Flatiron School on 1/11/17.
//  Copyright © 2017 Samantha John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HopscotchProjectCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *projectTitle;
@property (weak, nonatomic) IBOutlet UILabel *projectAuthor;
@property (weak, nonatomic) IBOutlet UIImageView *projectImage;

@end
