//
//  VKPhotoViewController.m
//  TestVK
//
//  Created by user on 17.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKPhotoViewController.h"
#import "VKPhotoModel.h"
#import "CustomPhotoCell.h"
#import "VKLoader.h"
#import "PhotoViewController.h"

@interface VKPhotoViewController ()
@property (nonatomic, strong) NSMutableArray* urlsOfPhotos;
@end

@implementation VKPhotoViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    UINib* nib = [UINib nibWithNibName:NSStringFromClass([CustomPhotoCell class]) bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:NSStringFromClass([CustomPhotoCell class])];
    self.urlsOfPhotos = [[NSMutableArray alloc]init];
    [self loadPhoto];
}

-(void) loadPhoto
{
    int albumId = [self.currentAlbum.albumId intValue];
    [VKLoader loadPhotosWithIdOfAlbum:albumId andWithSuccessBlock:^(NSArray *photos) {
        [self.urlsOfPhotos addObjectsFromArray:photos];
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"error");
    }];
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.urlsOfPhotos count];
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomPhotoCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CustomPhotoCell class]) forIndexPath:indexPath];
    [cell updatePhotoView:self.urlsOfPhotos[indexPath.item]];
    return cell;
}
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toPhotoView" sender:self];
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PhotoViewController* photo = segue.destinationViewController;
    NSIndexPath* selectedCell = [[self.collectionView indexPathsForSelectedItems] firstObject];
    photo.photo = [self.urlsOfPhotos objectAtIndex:selectedCell.item];
}
@end
