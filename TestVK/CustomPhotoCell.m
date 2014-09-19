//
//  CustomPhotoCell.m
//  TestVK
//
//  Created by user on 17.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "CustomPhotoCell.h"
#import "VKPhotoModel.h"
#import "UIKit+AFNetworking.h"
#include "VKPhotoViewController.h"
@implementation CustomPhotoCell

- (void) updatePhotoView:(VKPhotoModel*) photo
{
    [self setPhotoFromURL: photo.urlOfSmallPhoto];
}

-(void) setPhotoFromURL:(NSURL*)urls{
    NSURLRequest* imageRequest = [NSURLRequest requestWithURL:urls];
    [self.thumbnailPhoto setImageWithURLRequest:imageRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        [self.spinner stopAnimating];
        self.thumbnailPhoto.image = image;
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        [self.spinner stopAnimating];
    }];
}

@end
