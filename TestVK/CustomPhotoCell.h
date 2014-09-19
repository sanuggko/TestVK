//
//  CustomPhotoCell.h
//  TestVK
//
//  Created by user on 17.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VKPhotoModel.h"
@interface CustomPhotoCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailPhoto;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

- (void) updatePhotoView:(VKPhotoModel*) photo;
-(void) setPhotoFromURL:(NSURL*)urls;
@end
