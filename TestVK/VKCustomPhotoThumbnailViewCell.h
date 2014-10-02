//
//  CustomPhotoCell.h
//  TestVK
//
//  Created by user on 17.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VKPhotoModel.h"

@interface VKCustomPhotoThumbnailViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoThumbnail;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

- (void)updatePhotoView:(VKPhotoModel *) currentPhoto;
- (void)setPhotoFromURL:(NSURL *) urlOfPhoto;

@end
