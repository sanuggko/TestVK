//
//  VKPhotoViewController.m
//  TestVK
//
//  Created by user on 17.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKPhotosThrumbnailViewController.h"
#import "VKPhotoModel.h"
#import "VKCustomPhotoThumbnailViewCell.h"
#import "VKLoader.h"
#import "PhotoViewController.h"

@interface VKPhotosThrumbnailViewController ()

@property (nonatomic, strong) NSMutableArray *arrayOfPhotosUrls;

@end

@implementation VKPhotosThrumbnailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UINib* nib = [UINib nibWithNibName:NSStringFromClass([VKCustomPhotoThumbnailViewCell class]) bundle:nil];
    [self.collectionView registerNib:nib
          forCellWithReuseIdentifier:NSStringFromClass([VKCustomPhotoThumbnailViewCell class])];
    self.arrayOfPhotosUrls = [[NSMutableArray alloc]init];
    [self loadPhoto];
}

- (void)loadPhoto
{
    int albumId = [self.currentAlbum.albumId intValue];
    [VKLoader loadPhotosWithIdOfAlbum:albumId andWithSuccessBlock:^(NSArray *urlsOfPhotos)
    {
        [self.arrayOfPhotosUrls addObjectsFromArray:urlsOfPhotos];
        [self.collectionView reloadData];
    }
                              failure:^(NSError *error)
    {
        NSLog(@"error in loadPhoto");
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.arrayOfPhotosUrls count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VKCustomPhotoThumbnailViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([VKCustomPhotoThumbnailViewCell class])
                                                                            forIndexPath:indexPath];
    [cell updatePhotoView:self.arrayOfPhotosUrls[indexPath.item]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toPhotoView" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PhotoViewController* photoViewController = segue.destinationViewController;
    NSIndexPath* selectedCell = [[self.collectionView indexPathsForSelectedItems] firstObject];
    photoViewController.currentPhoto = [self.arrayOfPhotosUrls objectAtIndex:selectedCell.item];
}

@end
