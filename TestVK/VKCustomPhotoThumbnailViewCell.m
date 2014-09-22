//
//  CustomPhotoCell.m
//  TestVK
//
//  Created by user on 17.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKCustomPhotoThumbnailViewCell.h"
#import "VKPhotoModel.h"
#import "UIKit+AFNetworking.h"
#include "VKPhotosThrumbnailViewController.h"

@implementation VKCustomPhotoThumbnailViewCell

- (void)updatePhotoView:(VKPhotoModel *) currentPhoto
{
    [self setPhotoFromURL: currentPhoto.urlOfSmallPhoto];
}

- (void) setPhotoFromURL:(NSURL *)urlOfPhoto
{
    NSURLRequest *imageRequest = [NSURLRequest requestWithURL:urlOfPhoto];
    [self.photoThumbnail setImageWithURLRequest:imageRequest
                               placeholderImage:nil
                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
    {
        [self.spinner stopAnimating];
        self.photoThumbnail.image = image;
    }
                                        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
    {
        [self.spinner stopAnimating];
    }];
}

@end
