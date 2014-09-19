//
//  VKPhotoViewController.h
//  TestVK
//
//  Created by user on 17.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VKAlbumModel.h"

@interface VKPhotoViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) VKAlbumModel* currentAlbum;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;


@end
