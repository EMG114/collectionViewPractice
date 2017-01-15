//
//  HopscotchProjectCollectionViewController.m
//  Hopscotch-iOS-Test
//
//  Created by Flatiron School on 1/11/17.
//  Copyright © 2017 Samantha John. All rights reserved.
//

#import "HopscotchProjectCollectionViewController.h"
#import "HopscotchDatastore.h"
#import "HopscotchProjectCollectionViewCell.h"
#import "HopscotchProject.h"

@interface HopscotchProjectCollectionViewController ()
@property (strong, nonatomic) HopscotchDatastore *dataStore;

@end

@implementation HopscotchProjectCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[HopscotchProjectCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    // Do any additional setup after loading the view.
    
    self.dataStore = [HopscotchDatastore sharedDataStore];
    [self.dataStore getProjectsWithCompletion:^(BOOL success) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.collectionView reloadData];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"%d", self.dataStore.projects.count);
    return self.dataStore.projects.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"Is this getting called");
    
    HopscotchProjectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    HopscotchProject *singleProject = self.dataStore.projects[indexPath.row];
    cell.projectTitle.text = singleProject.title;
    cell.projectAuthor.text = singleProject.author;
    

//    NSURL *imageURL = [NSURL URLWithString:[singleProject.screenShotURL stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
    
//    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//       cell.projectImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]];
//    }];
    
    //The idea here was to make sure to have that url to the screenshot and then use that to update the projectImage. And then wrap the update of the UI element using NSOperation to update the main queue hence updating the UI 
    
    if (singleProject.image == nil){
        
        NSString *url = singleProject.screenShotURL;
        
        NSURL *nsurl = [NSURL URLWithString:url];
        
        NSURLSession *thisSession = [NSURLSession sharedSession];
        
        NSURLSessionDataTask *thisTask = [thisSession dataTaskWithURL:nsurl completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
        {
            cell.projectImage.image = [UIImage imageWithData:data];
            
        }];
        
        [thisTask resume];
    }
    else {
        cell.projectImage.image = [UIImage imageWithData:singleProject.screenShotURL];
    }
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
